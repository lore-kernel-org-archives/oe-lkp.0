Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9220487BF
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jun 2024 08:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402408; cv=fail; b=LWNOyVO7QH2G7aw+BcS6xcgB3alHbmT5AvLhGNFWEqo/GbDPDBs65n+bbDJJ5RAT2Q/CYVCaoZwZIuApzXFwSCLMVI6RihPdOPXkm9SkhJAM9wiP3R8FNe5xp9Zb+0STA1mXI45VoBKF4kJPOwByelUY/LvCP7na0l0c9jNJIcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402408; c=relaxed/simple;
	bh=HPuQWmiBJEqye2qUCD5OXtBHYxfV1dIQZ/xfI3QxKkE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FvYA9sQMNFDxTPDD352aqxV7N3o4qxSnVuTRd8VtwKkvhfBdqf6RRwWNlzqN75paLgd2mPJ2jhvIwjuNKkqEWEPfjJ0wwvHEb5IxeZH+35MW76ixbaHgyNG65GbjsbifXZu5HIsH3YXV/+jmKDLkR46Pf5IOyTWDNFBHYLI9/fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuM3vS75; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuM3vS75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717402406; x=1748938406;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HPuQWmiBJEqye2qUCD5OXtBHYxfV1dIQZ/xfI3QxKkE=;
  b=UuM3vS75Mv5T+J/iHk67zIXNElstuoSFGPUXErRxbu/ifXiGwLm4bKLa
   kP2iKSntxJAzCN265GD9ngxqlAgeiftv/iWd+AbQ8VFWCVKF9Wwp08r0/
   /nZuU1bkSBiH2uGcyDRrIn0YdzHwVjOObwmJfpbbO+iDLlx8E43X3kAGt
   qIsCAtqJVNEoGtra4eklpuakBmwXK4lT9fKqplBI9i6FUpmoeZ2pCzV+d
   oElGx0di9fn74WYUYvfUvwudZFyBduY/5k9I/QkkmMJrKOQ/3P9GiB2sM
   7BI4F7rgZmCPKTRURn9I9a7WvTZFihs/4Y2xs0yO5lr0H2ncW+q5mp16o
   Q==;
X-CSE-ConnectionGUID: w68vXM1URzabYxaGzkLPfQ==
X-CSE-MsgGUID: x1f0EVQnRViHU2Se//7g+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="36407539"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36407539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:13:25 -0700
X-CSE-ConnectionGUID: a/JG54vCRIKv7tNqrDId/Q==
X-CSE-MsgGUID: f8rQGaThQW+Q8txrB7TvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41251032"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 01:13:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:13:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:13:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 01:13:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 01:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+00zJQ6oftwntqfCz0SdhS2OtYv8Ltmxqi9jNq00ETpHcp54M42rD3wbR86OmrZlr+ifRqMyjjYaf4DwsnuyKVl/g/hjQ9bxemW2ZWn5ZDH6kS2MzJHnXuje/rHAR9T3DSB9gKOzYy9QQ7YvV4URnxOMPjq6Btye+LmsGuJ+62HbD/crMcZzt5nTXdYR84tPNeOMgm5WGLmCcIMF+bPeQzcc2PqLIuoQyY71q72TPKXs8wIUgiCbJL3ihRK9Ju7iJR3rto7RDYUBcUAVUqGDtUblaw7UXdyoQYVrrR01RAn1XWWZJmAL3dz9YJitU9BIVXv5nnTk7m8ugaW4XQdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fX61thdnB2Ld3oQRlbbslNDtFMFGwz/SVg8V2gIClk8=;
 b=N+1EJ67LtYyXLrhw/M2XwM1dMaugg7pUgoBZNVwQ3/H1Y09hZFvn1fmR6jyJGK+3cZD9kiJLvh9poQ1doOxA1Slr/zJt0jz8ShF/rvlSV0s9Lg8I1aNPRVVSamNOi+q4YGBeTIvJTH+Ydvl88sWmGtl4LJKm1YCY4TEJ7JmLF5q5fc+EtSscjGgpLppTPT12uzohWb+OtOON1TTmb69yWzihY7KKLWZN46CQ9PB2zp+PH7e/Np1ZHW8gGqEYcL6LVzJUhozBO/LF2MYO1FmTUAfXheAf08yUm89nkVsmgpo9gMXqQHdhlIj3MR/oyTG7QY5iGkpXDBe8oNCvcFyo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.36; Mon, 3 Jun
 2024 08:13:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 08:13:21 +0000
Date: Mon, 3 Jun 2024 16:13:13 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>, <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<oliver.sang@intel.com>
Subject: Re: [amir73il:sb_write_barrier] [fanotify] 9d1fd61f1d:
 unixbench.throughput -7.9% regression
Message-ID: <Zl17GT2kWZw1EZTA@xsang-OptiPlex-9020>
References: <202405291640.2016ebfe-oliver.sang@intel.com>
 <CAOQ4uxiu_1QQMEH5OJ+vjA0K-y9TycYb8W=+nFQMTKJz6ZONhg@mail.gmail.com>
 <ZllA260+kaBSKrPD@xsang-OptiPlex-9020>
 <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxjtM0ptu5SLA0c9VpRqvSLX8_Z+QAxa_ztrgy=aiV2DXQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b71eca-6481-4635-81eb-08dc83a5082a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eS9BclNOYUxvUFYxOHp2bEJPRTIwWDAyaXZma0JDK3RkVnhiMDNURzNrd2JO?=
 =?utf-8?B?SlU2MXJvZ3E2Ry9lTHQ2UG1WdkNHTmlMbVZVYmRpVXdrSHd4V3RPZHNwaFpP?=
 =?utf-8?B?cmswaUptcDF5MDBJNVJwTy9nQ05qMUFQaU5SRllWZGkzZzRnTlJWdjdnWmdG?=
 =?utf-8?B?MDRQV2M3ZDIzRFZSc2FmcFVFTWxOeU80OVl0eXBLdzhMZUZOK3RuYmZJN3RE?=
 =?utf-8?B?MTJIUXhHYkRreE9VZVdDNWgzTnhtY2hjRmJveTVwYStpbjZqMDY2b20wSHlD?=
 =?utf-8?B?ZUxsQUR5c0VUWFRqOVZYV05rNWxiaTlFSWdTSlp3Z3VQdFRMMGthQmZ4RVU5?=
 =?utf-8?B?V1FodWNha25wd2xGVHUxaU8yZVZwd2VjUTJqaEVXcGFwbFA2S2ZlSnF1ODRY?=
 =?utf-8?B?SFBGd0NPdndMUFRqSzROUTRSUjZQZy9SNVhVZmVGNDJaVklycVhNUHF0ZnhL?=
 =?utf-8?B?QUlJTm94bSt5dmI5YmxENmducTVxalVNbXdGVThEclN1OXNhU1ZoNHAvYmhv?=
 =?utf-8?B?Z09aVGI3ZG0vV0JobnYyZVpZbTdYRUNTajhzczBycWRUL0wyTitiZlNFY2My?=
 =?utf-8?B?blNXbytkeWJsQzcvOSttdWdQVXBBUlNqaTNDaWJTdzkxWVZFL3VPQ09TK2No?=
 =?utf-8?B?Q0tEcEs5OEV2aGVKWkE0UTJ1eFl1MkEwd3BVZSs5bEVKY0s5cnI3aFFuUzls?=
 =?utf-8?B?SWIyZkZLenlTazlNUnBCUVYySURzQWJsL0R2VDFQVFFBTG1qKzlPTG5kdmhK?=
 =?utf-8?B?OXcyODA4TW9YSkI1NVo2enNub0ZwT09CaDczMUZRRkl3TkI0S3NMdHJSbVpI?=
 =?utf-8?B?VkFFODhiQ3gzM1BjUDk1djFjUTQ4a1dBNFpoVklRa3pQT3JWTHcwNXhjbGtP?=
 =?utf-8?B?UHRtQzJFSWVJUXphQVM5RkRxM3NzbGVleTh0TkRvTFNVMWdvRGNocmpOVXIv?=
 =?utf-8?B?ckhLUDJscFZwUkI0RkFLV2dyZlQ5V1Izb00wRWxnM0FMMjhjdHY2eFpFSWNQ?=
 =?utf-8?B?V1U4SGllNGRpSXNhbU82eGJLSEdSc3I4ci9IVWlwQ2djMDdISHlTenMrbmZQ?=
 =?utf-8?B?VmN4a21YN2xMTzFoYkc0U29wSElwazM5MHBIOVVWQmVRM1V2cmo5MDd3akJn?=
 =?utf-8?B?N3JsOFUrdmtKamcwNzRLT1ZhU3ZzZVlMYWJUeVEvejVMcU9KRXN1SWViUTQy?=
 =?utf-8?B?a2YxR0NUd1hITG9uQlNNUlMvSjFoZ2o3aFR6czN0d0RrZ1hJdnJsaWxiRDdX?=
 =?utf-8?B?OEZmeDJ6bmpiN3RGclBpdStVNUtTMGFNcmZGRFdlMHh2aVhKZG9FaHZucFpr?=
 =?utf-8?B?Tzd1Y2syYnh2K2ZuWXFmZ0c2U2ZOaUlCeEJrazcveTNteEpDS242R2VxdHBM?=
 =?utf-8?B?d1dPSjNFY3ZkbGxvd3NMYmhhSGt6ZnU5NmgwYnRJVFZMenRNYmJmWnRST2dx?=
 =?utf-8?B?dWdrblFBQzdKSzNKbG1ONzRBQ1JmRmRuaGJNNW8zaldZRVJJQ1NDVUljbFdL?=
 =?utf-8?B?aUZrTjFJS3p6YjVkS2tQQmw5dzdVa1VJWWg0WVY5MzNFZTRsWUJTU3oycUlM?=
 =?utf-8?B?L00rUitGYlYzUVJSVTBGczFhb1J6SzhOcmpwOUc0SlZIOEp4TlEzTkt6eXZZ?=
 =?utf-8?B?WlNNUUtTMmllYnF6MWdsa3huTExGeitMY1YxRC85YWhvNGFWUFNKTlBiL0VO?=
 =?utf-8?B?TVZpdnUyS0FKNkRJZ3Z4aVF4aVNyYTgvOXNVM0hQS3JQejk1L215ZzhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RXMWZGa1F3T00xaTR3elFhOXN1bzNkY0dyekZrYkRCaUxSTnpWaGdlTU9h?=
 =?utf-8?B?OVlwM2hXVytyZkRUcytJTWVodmZ1U0JZM0ZZZkkycUx4ZXV4UHRkejlOQ0lw?=
 =?utf-8?B?d0pOZnUyWWpKWUNVa2kvS0RlUXdNYTMyUTg3VUo0TWE2RllVTEZoRlRwTEZJ?=
 =?utf-8?B?dExlZzltNEI5WS8zaVQ1eVIxNEQvRTdZbnBuOStUOW5QZVpXRWZCZ3A2VWNn?=
 =?utf-8?B?b1YwS0ErRGRsSGZHTll6R0JHMWVPUXF3czh3eU9Wa1IrZWpCUVpsV0NMcUZW?=
 =?utf-8?B?SnErc3NDOTVZY3poQkEvY00vZklpTGdJcjMrV3hCZkZaR3diRGNBaS9xZ2NH?=
 =?utf-8?B?WmZNTlh1d25uT1ovMUhWZ2poanRDRDdFZzUvaklFaUdPYlorR1puU3Vrb3Jh?=
 =?utf-8?B?QVF6cWh2L1hVNFU4dGgwTnk0aTluWmxwbXBBODhtSXpSNkhiaytjVXRwUkRZ?=
 =?utf-8?B?aTRRUGFXZ2xUVHJhMVlFRDRhenNrNzNGWVk2bzBvYjZSOUlBMDIzZ2Q1ZWJi?=
 =?utf-8?B?YkhQTnhYaFk4d3IrbTdhSE9sZm9YdHZYZExINFJSeHFOTTNoTFp6bDEvY3Iy?=
 =?utf-8?B?Q25jWWx3L0QvYUlrRUhKaUZPdmQ4Y2kzZ3VFLzR3dWNIOWF0ODhHVmEzUmkx?=
 =?utf-8?B?VHdBWk5NVTJqdEU5c3NjOTJHWDVQMklPN3Bic3FzTnF2UzZraUxvL2R0djFJ?=
 =?utf-8?B?eFhwRXRjQ3k2aDA4MW0yZkFCMk1iMGlKNkhCMDY1cGM5cTRVYWtMZW5NQzV5?=
 =?utf-8?B?WUpIT251OTJXdjZab1BnOUdEL0pmV1ZienV1RFNndEhPWTZhY2JNM1FTZlFa?=
 =?utf-8?B?Y205c29ZME5KN2ZlSEZVYnpMNVowZU1zWkM1OGpmc1E5N3JvVTFSK2R1L0lp?=
 =?utf-8?B?WkFQRDdDQm95a2JsSXhmNXNSRUVWTjA2S2tIWk5SbGJEaElmTWFBUEt4a0Yy?=
 =?utf-8?B?V2dPWDZyZFowVzBhNndSa0U2U1lPM2V0Vlk0ZXYvbEtmVnlVdS9aSDRWaDRM?=
 =?utf-8?B?OTRxUlBKTzMxTHIrdjNkbUZDQlB0cVZqamRuMjR5Y2wvR2tTUGkwQzI4cFVs?=
 =?utf-8?B?NzJVamcwbllhWXZ1aHhOQ2t5WVE4QVlxdXAzeFBPLzBFSkg1cGorbndJRks5?=
 =?utf-8?B?VEFrWnozVTNXdWM0UE1wVVRzeWFwWG80MG5LdTE2QStwa0N1TGlkUmJZYmMx?=
 =?utf-8?B?T2hQdFJvK3ZCenlmUjdNY2ZNYmp4V01jTTE5ZkhCRTBKOEI1TlVZUzR0YlZk?=
 =?utf-8?B?MnFvV21Wa2pUcnp3QWlxYitqOWc4Rm5zcHpaNTVHTnRBbU9DR3lJMDRBWlJv?=
 =?utf-8?B?YnVpOXBGQXh2dmVGVVdHVnp5S01wenpxeDlHN1R1OVl3eUlVNis4c2NIajJ1?=
 =?utf-8?B?MWFFVkRHcXJENmNHWldlVUNUZnl6VmhCMVZuWHJNOFcvejkzVjhlRk1nVFVi?=
 =?utf-8?B?Mkx1KzcyZGU4aWhmbHJmT1pycURsSnIxRm9wcTBZMlJxU0g0dlhCRk5Yak5I?=
 =?utf-8?B?SXFUVkZvZ2dIZjUvNGNhSzFDckxHZFFZN1dmclpXcVVuaU1teWltSjNMbmp2?=
 =?utf-8?B?cmxtWjhRY1FOT2dZdWp2YmZMYklERzBRd2JyQ2RMRFo4akxHcm04S2VLUkpH?=
 =?utf-8?B?MHA0Nmdwd1JSRnVrckJzWFFBdXNKQ3NZak5YYWNMMFlaUFp0NzV2YVJLSWV1?=
 =?utf-8?B?WUw3R0NsdXl4NEJFRmhFTTVQa2xSeTFueXk1aHJnQWFwV0hsSGFLcW51b0hh?=
 =?utf-8?B?YUZBSHZZN285c1FiZDdSM2ZjeTg5eUEwUEtIQTFxcksrVnc5NW41dlZaQmZm?=
 =?utf-8?B?Q1VGOVBadzJBSGNzRTZMVHBFbm9seTJBbWs1TTc0dEcxa3pWOGd3azJlM0N5?=
 =?utf-8?B?d0FMcm9qNkpmZDRVTll1b3ZnMW1KUHlzcEpLUjVKamhGdk1reDNkWTlTak1h?=
 =?utf-8?B?UXVYa1N6b09XVysyZGR5UTVJenVDcUJSMWJmRktPT3c5NmpwM3o1Y1dwVDV3?=
 =?utf-8?B?WTY1YTlpejdSTW4vd2RSVEcxUnJYcW1FcVFYK0czbjRZYnJ6ZnZoODR4enZL?=
 =?utf-8?B?M1BnTVA4d0VtYTcwN0ZPbm9WeHNxK1Zxd1M4dnZuZmNPYVFRTWd6REF3dVpF?=
 =?utf-8?B?UkJZUTI1dmFrUytCWkppR3hzb2dlRVZ1bUUzai8vQ0dPUzZzemtoZWE3K1lR?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b71eca-6481-4635-81eb-08dc83a5082a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 08:13:21.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xqh6SsRYFXBg+x4ugSeoJaJwdoABJo04Vp491RFzDzEyw+3WeE/kKy1nrDPgHpjxzsfyu3ENnn8GKtnJI1UX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com

hi, Amir,

On Fri, May 31, 2024 at 08:18:09AM +0300, Amir Goldstein wrote:
> On Fri, May 31, 2024 at 6:15 AM Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > hi, Amir,
> >
> > On Wed, May 29, 2024 at 02:17:55PM +0300, Amir Goldstein wrote:
> > > On Wed, May 29, 2024 at 11:26 AM kernel test robot
> > > <oliver.sang@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a -7.9% regression of unixbench.throughput on:
> > > >
> > > >
> > > > commit: 9d1fd61f1d9bb74e44bdcc8767ba7008a08c6075 ("fanotify: pass optional file access range in pre-content event")
> > > > https://github.com/amir73il/linux sb_write_barrier
> > > >
> > >
> > > Jan,
> > >
> > > I speculate that the regression is due to the fact that we store and pass the
> > > path information on struct file_range on the stack before the optimizations
> > > in fsnotify_parent(), so rw_verify_area() pays some price for the stores
> > > and __fsnotify_parent() pays a bigger price for fetches?
> > >
> > > Luckily, we already have the way to check
> > > fsnotify_sb_has_priority_watchers(inode->i_sb,
> > >                                                FSNOTIFY_PRIO_PRE_CONTENT))
> > > so now I used it to optimize out the fsnotify_file_range() inline
> > > code entirely.
> > >
> > > Oliver,
> > >
> > > Can you please re-test with fixed branch (also rebased on v6.10-rc1):
> > >
> > > * a82fd282befc - (fan_pre_content) fanotify: report file range info
> > > with pre-content events
> > > * f301cd18006c - fanotify: rename a misnamed constant
> > > * 64108c0b47db - fanotify: pass optional file access range in pre-content event
> > > * 94167e071109 - fanotify: introduce FAN_PRE_MODIFY permission event
> > > * 68e04c2451ba - fanotify: introduce FAN_PRE_ACCESS permission event
> > > * 83af0c89527a - fsnotify: generate pre-content permission event on exec
> > > * aca408421327 - fsnotify: generate pre-content permission event on open
> > > * 93656e196b00 - fsnotify: introduce pre-content permission event
> > >
> > > The optimization was done in the first commit (fsnotify: introduce
> > > pre-content permission event),
> > > but impacts the regressing commit (fanotify: pass optional file access
> > > range in pre-content event).
> > > no need to test all middle commits.
> >
> > I directly compare the tip with v6.10-rc1, still a regression but better now
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   v6.10-rc1
> >   a82fd282befc7 ("fanotify: report file range info with pre-content events")
> >
> >        v6.10-rc1 a82fd282befc71d99106bf31066
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >  1.216e+08            -3.9%  1.168e+08        unixbench.throughput
> >
> > full data is as below [1]
> >
> >
> > then I checked new "64108c0b47db - fanotify: pass optional file access range in pre-content event"
> >
> > it also has a small regression comparing to its parent, but better also.
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
> >   gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench
> >
> > commit:
> >   94167e071109d ("fanotify: introduce FAN_PRE_MODIFY permission event")
> >   64108c0b47db9 ("fanotify: pass optional file access range in pre-content event")
> >
> > 94167e071109d573 64108c0b47db91b20d658a89969
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >  1.163e+08            -2.4%  1.135e+08        unixbench.throughput
> >
> > full data is as below [2]
> >
> 
> Ok, this looks sane, the small overhead in the write path makes sense.
> It may have been a "tactic mistake" merging this optimization to v6.10-rc1
> a5e57b4d370c ("fsnotify: optimize the case of no permission event watchers")
> before the rest of the pre-content infrastructure, because together they
> would still be a performance win.
> 
> Can you please compare this branch to v6.9?

there is no obvious diff between v6.9 and v6.10-rc1 for this test in our tests.

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-13/performance/x86_64-rhel-8.3/100%/debian-12-x86_64-20240206.cgz/300s/lkp-spr-r02/fsbuffer-w/unixbench

commit:
  v6.9
  v6.10-rc1
  a82fd282befc7 ("fanotify: report file range info with pre-content events")

            v6.9                   v6.10-rc1 a82fd282befc71d99106bf31066
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
   9218048 ± 19%     +33.1%   12267178 ±  6%     +14.2%   10523306 ±  7%  meminfo.DirectMap2M
    151289           +63.8%     247886 ±  6%     +61.4%     244132 ±  4%  meminfo.DirectMap4k
      0.52            +0.1        0.58            +0.1        0.59        mpstat.cpu.all.irq%
      0.01            -0.0        0.01 ±  4%      -0.0        0.01        mpstat.cpu.all.soft%
     10241            -9.1%       9314 ± 11%     -15.6%       8648 ± 15%  sched_debug.cpu.curr->pid.min
    -35.33           -55.4%     -15.76           -62.3%     -13.31        sched_debug.cpu.nr_uninterruptible.min
    109116 ± 96%     -85.8%      15473 ±125%      +8.6%     118471 ± 81%  numa-meminfo.node0.AnonHugePages
   4803556 ±  2%      -3.5%    4636196 ±  2%     -31.7%    3278497 ± 41%  numa-meminfo.node0.MemUsed
    574474 ± 29%     +45.5%     836146 ±  6%      -6.8%     535267 ± 45%  numa-meminfo.node1.AnonPages.max
   1773634 ±  6%      +8.9%    1931750 ±  5%     +85.6%    3291386 ± 41%  numa-meminfo.node1.MemUsed
     35.33 ± 15%     -73.1%       9.50 ± 24%     -58.5%      14.67 ± 27%  perf-c2c.DRAM.local
    181.67 ± 11%     -74.7%      46.00 ± 12%     -69.6%      55.17 ± 18%  perf-c2c.DRAM.remote
    298.67 ±  7%     -82.2%      53.17 ±  9%     -79.1%      62.33 ± 21%  perf-c2c.HITM.local
    125.67 ± 15%     -77.1%      28.83 ± 15%     -72.9%      34.00 ± 22%  perf-c2c.HITM.remote
    265024            -1.2%     261842            -0.8%     262871        time.involuntary_context_switches
     25.33 ± 16%     -61.2%       9.83 ± 23%     -59.2%      10.33 ± 22%  time.major_page_faults
      7168            +0.9%       7234            +0.9%       7234        time.maximum_resident_set_size
      6286            -1.4%       6199            -7.1%       5841        time.user_time
     70712            -1.7%      69536            -0.9%      70096        proc-vmstat.nr_active_anon
      9037            +1.4%       9162 ±  2%      +2.9%       9301        proc-vmstat.nr_page_table_pages
     73584            -1.8%      72274            -1.1%      72752        proc-vmstat.nr_shmem
     70712            -1.7%      69536            -0.9%      70096        proc-vmstat.nr_zone_active_anon
     35571 ±  8%      -9.5%      32176 ±  3%     -15.7%      29987 ±  4%  proc-vmstat.pgactivate
 1.219e+08            -0.2%  1.216e+08            -4.1%  1.168e+08        unixbench.throughput
    265024            -1.2%     261842            -0.8%     262871        unixbench.time.involuntary_context_switches
      7168            +0.9%       7234            +0.9%       7234        unixbench.time.maximum_resident_set_size
      6286            -1.4%       6199            -7.1%       5841        unixbench.time.user_time
 4.521e+10            -0.2%  4.513e+10            -4.1%  4.338e+10        unixbench.workload
 1.476e+11            -1.2%  1.458e+11            -3.9%  1.419e+11        perf-stat.i.branch-instructions
   7506784            -2.1%    7347431            -2.4%    7329399        perf-stat.i.branch-misses
   3830897 ±  5%      +2.2%    3915539 ±  8%    +523.5%   23884093 ±  9%  perf-stat.i.cache-misses
  30323968 ±  2%      +6.9%   32425619 ±  3%    +430.9%   1.61e+08 ±  4%  perf-stat.i.cache-references
      0.94            +1.6%       0.95            +1.6%       0.95        perf-stat.i.cpi
    157608 ± 12%      -4.1%     151202 ± 16%     -79.5%      32364 ± 56%  perf-stat.i.cycles-between-cache-misses
 7.003e+11            -0.6%  6.961e+11            -2.5%  6.828e+11        perf-stat.i.instructions
      1.23            -1.0%       1.22            -2.3%       1.20        perf-stat.i.ipc
      0.09 ± 14%     -56.1%       0.04 ± 20%     -64.9%       0.03 ± 22%  perf-stat.i.major-faults
      0.01 ±  5%      +3.3%       0.01 ±  9%    +540.2%       0.04 ± 10%  perf-stat.overall.MPKI
      0.01            -0.0        0.01            +0.0        0.01        perf-stat.overall.branch-miss-rate%
      0.75            +0.6%       0.75            +2.6%       0.77        perf-stat.overall.cpi
    136694 ±  5%      -2.1%     133775 ±  8%     -83.9%      22060 ±  9%  perf-stat.overall.cycles-between-cache-misses
      1.34            -0.6%       1.33            -2.5%       1.31        perf-stat.overall.ipc
      5752            -0.5%       5721            +1.5%       5836        perf-stat.overall.path-length
 1.469e+11            -1.2%  1.452e+11            -3.8%  1.413e+11        perf-stat.ps.branch-instructions
   3815245 ±  5%      +2.8%    3921138 ±  8%    +524.3%   23818053 ±  9%  perf-stat.ps.cache-misses
  30276290 ±  2%      +7.1%   32415461 ±  3%    +429.3%  1.603e+08 ±  4%  perf-stat.ps.cache-references
  6.97e+11            -0.5%  6.932e+11            -2.5%  6.797e+11        perf-stat.ps.instructions
      0.09 ± 14%     -56.0%       0.04 ± 21%     -64.6%       0.03 ± 23%  perf-stat.ps.major-faults
 2.601e+14            -0.7%  2.582e+14            -2.7%  2.532e+14        perf-stat.total.instructions
     58.72            -0.8       57.94            +0.5       59.20        perf-profile.calltrace.cycles-pp.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     38.04            -0.8       37.28            +0.1       38.12        perf-profile.calltrace.cycles-pp.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      5.91            -0.6        5.30            -0.5        5.38        perf-profile.calltrace.cycles-pp.fault_in_readable.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write
     78.64            -0.5       78.13            +0.8       79.41        perf-profile.calltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      2.65            -0.5        2.18            -0.5        2.12        perf-profile.calltrace.cycles-pp.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write
     83.29            -0.5       82.83            +0.6       83.86        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      6.45            -0.5        5.99            +0.8        7.25 ±  3%  perf-profile.calltrace.cycles-pp.filemap_get_entry.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
     84.71            -0.4       84.26            +0.5       85.21        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
      6.59            -0.4        6.17            -0.3        6.27        perf-profile.calltrace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     74.65            -0.4       74.26            +0.9       75.59        perf-profile.calltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     13.74            -0.3       13.39            +0.6       14.36        perf-profile.calltrace.cycles-pp.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
     12.63            -0.3       12.30            +0.7       13.30        perf-profile.calltrace.cycles-pp.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter.vfs_write
      4.62            -0.3        4.32            +0.3        4.96        perf-profile.calltrace.cycles-pp.rw_verify_area.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.78 ±  2%      -0.3        2.50            -0.4        2.35        perf-profile.calltrace.cycles-pp.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write.ksys_write
      3.62            -0.3        3.34            -0.3        3.28        perf-profile.calltrace.cycles-pp.security_file_permission.rw_verify_area.vfs_write.ksys_write.do_syscall_64
      2.06            -0.1        1.92            -0.1        1.95        perf-profile.calltrace.cycles-pp.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      2.92            -0.1        2.81            -0.2        2.72 ±  2%  perf-profile.calltrace.cycles-pp.down_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.75            -0.0        0.70            -0.1        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.down_write.generic_file_write_iter.vfs_write.ksys_write
      0.93            -0.0        0.89            -0.0        0.88        perf-profile.calltrace.cycles-pp.generic_write_check_limits.generic_write_checks.generic_file_write_iter.vfs_write.ksys_write
      0.99            -0.0        0.96            -0.0        0.98        perf-profile.calltrace.cycles-pp.timestamp_truncate.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
      0.74            -0.0        0.72            -0.0        0.71        perf-profile.calltrace.cycles-pp.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.63            -0.0        0.62            -0.0        0.61        perf-profile.calltrace.cycles-pp.__cond_resched.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.87            -0.0        0.86            -0.0        0.82        perf-profile.calltrace.cycles-pp.aa_file_perm.apparmor_file_permission.security_file_permission.rw_verify_area.vfs_write
      0.64            -0.0        0.63            -0.0        0.59        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.75            -0.0        0.75            +0.0        0.77        perf-profile.calltrace.cycles-pp.folio_mark_dirty.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write
      0.68            +0.0        0.68            -0.0        0.66        perf-profile.calltrace.cycles-pp.__cond_resched.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      0.91            +0.0        0.92            -0.0        0.88        perf-profile.calltrace.cycles-pp.balance_dirty_pages_ratelimited_flags.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.84            +0.0        0.86            -0.0        0.83        perf-profile.calltrace.cycles-pp.xattr_resolve_name.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      0.63            +0.0        0.65            -0.0        0.60 ±  2%  perf-profile.calltrace.cycles-pp.w_test
      5.29            +0.0        5.30            +0.1        5.36        perf-profile.calltrace.cycles-pp.simple_write_end.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      0.89            +0.0        0.92            -0.0        0.87        perf-profile.calltrace.cycles-pp.folio_wait_stable.__filemap_get_folio.simple_write_begin.generic_perform_write.generic_file_write_iter
      1.59            +0.0        1.62            -0.0        1.55        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.61 ±  2%      +0.0        0.64            +0.0        0.63        perf-profile.calltrace.cycles-pp.xas_start.xas_load.filemap_get_entry.__filemap_get_folio.simple_write_begin
      1.62            +0.1        1.68            -0.0        1.59        perf-profile.calltrace.cycles-pp.up_write.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      1.05            +0.1        1.11            -0.1        0.91        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.write
     96.77            +0.1       96.84            +0.2       96.98        perf-profile.calltrace.cycles-pp.write
      6.92            +0.1        7.01            -0.1        6.80        perf-profile.calltrace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.generic_file_write_iter.vfs_write.ksys_write
      2.87            +0.1        2.97            +0.7        3.57        perf-profile.calltrace.cycles-pp.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write
      3.53            +0.1        3.63            +0.7        4.24        perf-profile.calltrace.cycles-pp.file_update_time.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      1.03            +0.1        1.13            +0.1        1.17        perf-profile.calltrace.cycles-pp.strcmp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags
      2.59            +0.1        2.71            +0.1        2.71        perf-profile.calltrace.cycles-pp.__vfs_getxattr.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter
      3.37            +0.2        3.53            +0.1        3.50        perf-profile.calltrace.cycles-pp.cap_inode_need_killpriv.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter
      0.62 ±  3%      +0.2        0.78 ±  2%      +0.5        1.13 ±  5%  perf-profile.calltrace.cycles-pp.ktime_get_coarse_real_ts64.inode_needs_update_time.file_update_time.__generic_file_write_iter.generic_file_write_iter
     13.02            +0.2       13.19            -0.5       12.50        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.write
      4.06            +0.2        4.23            +0.2        4.22        perf-profile.calltrace.cycles-pp.security_inode_need_killpriv.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write
      6.66            +0.2        6.88            +0.2        6.91        perf-profile.calltrace.cycles-pp.file_remove_privs_flags.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write
      3.48            +0.2        3.73            +0.2        3.64        perf-profile.calltrace.cycles-pp.__fsnotify_parent.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     11.67            +0.3       12.01            +0.9       12.62        perf-profile.calltrace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.vfs_write.ksys_write.do_syscall_64
      0.00            +0.5        0.52            +0.5        0.52        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
      0.00            +0.5        0.53            +0.5        0.51        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.write
     59.32            -0.8       58.52            +0.5       59.78        perf-profile.children.cycles-pp.generic_file_write_iter
     38.93            -0.8       38.16            +0.1       39.01        perf-profile.children.cycles-pp.generic_perform_write
      3.10            -0.6        2.47            -0.7        2.41        perf-profile.children.cycles-pp.xas_load
     79.22            -0.5       78.74            +0.8       80.00        perf-profile.children.cycles-pp.ksys_write
      6.64            -0.5        6.18            +0.8        7.44 ±  3%  perf-profile.children.cycles-pp.filemap_get_entry
     85.12            -0.4       84.67            +0.5       85.63        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     83.94            -0.4       83.50            +0.6       84.51        perf-profile.children.cycles-pp.do_syscall_64
      6.86            -0.4        6.42            -0.3        6.53        perf-profile.children.cycles-pp.fault_in_iov_iter_readable
     75.55            -0.4       75.13            +0.9       76.42        perf-profile.children.cycles-pp.vfs_write
      6.08            -0.4        5.69            -0.3        5.75        perf-profile.children.cycles-pp.fault_in_readable
     13.92            -0.3       13.58            +0.6       14.54        perf-profile.children.cycles-pp.simple_write_begin
     13.03            -0.3       12.68            +0.7       13.68        perf-profile.children.cycles-pp.__filemap_get_folio
      4.86            -0.3        4.56            +0.5        5.33        perf-profile.children.cycles-pp.rw_verify_area
      4.01            -0.3        3.71            -0.4        3.64        perf-profile.children.cycles-pp.security_file_permission
      3.02 ±  2%      -0.3        2.74            -0.4        2.58        perf-profile.children.cycles-pp.apparmor_file_permission
      2.42            -0.2        2.25            -0.1        2.27        perf-profile.children.cycles-pp.generic_write_checks
      3.11            -0.1        2.98            -0.2        2.90 ±  2%  perf-profile.children.cycles-pp.down_write
      4.28            -0.1        4.18            -0.3        4.00        perf-profile.children.cycles-pp.__cond_resched
      1.05            -0.0        1.00            -0.1        1.00        perf-profile.children.cycles-pp.generic_write_check_limits
     98.99            -0.0       98.96            +0.0       99.02        perf-profile.children.cycles-pp.write
      2.45            -0.0        2.42            -0.1        2.30        perf-profile.children.cycles-pp.rcu_all_qs
      1.10            -0.0        1.07            -0.0        1.09        perf-profile.children.cycles-pp.timestamp_truncate
      0.99            -0.0        0.98            -0.1        0.94        perf-profile.children.cycles-pp.aa_file_perm
      0.76            -0.0        0.75            -0.0        0.71        perf-profile.children.cycles-pp.x64_sys_call
      0.33            -0.0        0.32            -0.0        0.31        perf-profile.children.cycles-pp.noop_dirty_folio
      0.23            -0.0        0.23 ±  2%      -0.0        0.22        perf-profile.children.cycles-pp.file_remove_privs
      0.59            +0.0        0.59            -0.0        0.56        perf-profile.children.cycles-pp.inode_to_bdi
      0.25            +0.0        0.25            -0.0        0.24        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited
      0.93            +0.0        0.93            +0.0        0.95        perf-profile.children.cycles-pp.folio_mark_dirty
      0.36            +0.0        0.36            -0.0        0.34        perf-profile.children.cycles-pp.amd_clear_divider
      0.37            +0.0        0.38            -0.0        0.35        perf-profile.children.cycles-pp.__x64_sys_write
      1.26            +0.0        1.26            -0.0        1.21        perf-profile.children.cycles-pp.balance_dirty_pages_ratelimited_flags
      5.69            +0.0        5.70            +0.1        5.75        perf-profile.children.cycles-pp.simple_write_end
      0.35 ±  2%      +0.0        0.36            +0.0        0.37        perf-profile.children.cycles-pp.__cmd_record
      0.35 ±  2%      +0.0        0.36            +0.0        0.37        perf-profile.children.cycles-pp.cmd_record
      0.35 ±  2%      +0.0        0.36            +0.0        0.37        perf-profile.children.cycles-pp.record__mmap_read_evlist
      1.08            +0.0        1.10            -0.0        1.07        perf-profile.children.cycles-pp.xattr_resolve_name
      0.39 ±  2%      +0.0        0.40 ±  3%      +0.0        0.41 ±  4%  perf-profile.children.cycles-pp.update_process_times
      0.42 ±  2%      +0.0        0.43 ±  3%      +0.0        0.44 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.44            +0.0        0.46            -0.0        0.42        perf-profile.children.cycles-pp.write@plt
      0.41 ±  3%      +0.0        0.43 ±  3%      +0.0        0.43 ±  4%  perf-profile.children.cycles-pp.tick_nohz_handler
      1.03            +0.0        1.05            -0.0        1.03        perf-profile.children.cycles-pp.folio_mapping
      0.08            +0.0        0.10 ±  4%      +0.0        0.10 ±  5%  perf-profile.children.cycles-pp.update_min_vruntime
      0.10            +0.0        0.13 ±  2%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.update_curr
      0.96            +0.0        0.99            -0.0        0.91        perf-profile.children.cycles-pp.w_test
      1.09            +0.0        1.12            -0.0        1.06        perf-profile.children.cycles-pp.folio_wait_stable
      1.95            +0.0        1.99            -0.1        1.90        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.00            +0.0        0.04 ± 44%      +0.1        0.05        perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.09            +0.1        0.15 ±  5%      +0.1        0.16 ± 14%  perf-profile.children.cycles-pp.ktime_get
      0.10 ±  4%      +0.1        0.15 ±  4%      +0.1        0.16 ± 13%  perf-profile.children.cycles-pp.clockevents_program_event
      4.36            +0.1        4.42            -0.2        4.18        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.50            +0.1        0.56            +0.0        0.53        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.68            +0.1        1.74            -0.0        1.65        perf-profile.children.cycles-pp.up_write
      1.14            +0.1        1.21            -0.1        1.00        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.55 ±  3%      +0.1        0.64 ±  3%      +0.1        0.66 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      7.05            +0.1        7.14            -0.1        6.94        perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.56 ±  3%      +0.1        0.65 ±  3%      +0.1        0.67 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.61 ±  2%      +0.1        0.70 ±  3%      +0.1        0.72 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.58 ±  2%      +0.1        0.67 ±  3%      +0.1        0.69 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      3.86            +0.1        3.96            +0.7        4.57        perf-profile.children.cycles-pp.file_update_time
      3.28            +0.1        3.39            +0.7        3.97        perf-profile.children.cycles-pp.inode_needs_update_time
      1.27            +0.1        1.38            +0.1        1.40        perf-profile.children.cycles-pp.strcmp
      3.25            +0.2        3.41            +0.1        3.38        perf-profile.children.cycles-pp.__vfs_getxattr
      0.73 ±  3%      +0.2        0.89            +0.5        1.24 ±  4%  perf-profile.children.cycles-pp.ktime_get_coarse_real_ts64
      3.60            +0.2        3.76            +0.1        3.73        perf-profile.children.cycles-pp.cap_inode_need_killpriv
      4.29            +0.2        4.47            +0.2        4.44        perf-profile.children.cycles-pp.security_inode_need_killpriv
      7.00            +0.2        7.23            +0.3        7.26        perf-profile.children.cycles-pp.file_remove_privs_flags
      7.20            +0.2        7.43            -0.1        7.06        perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.3        0.27 ±  2%      +0.3        0.27 ±  2%  perf-profile.children.cycles-pp.sched_tick
      3.54            +0.3        3.82            +0.2        3.72        perf-profile.children.cycles-pp.__fsnotify_parent
     12.00            +0.3       12.35            +1.0       12.96        perf-profile.children.cycles-pp.__generic_file_write_iter
      5.93            -0.4        5.54            -0.3        5.59        perf-profile.self.cycles-pp.fault_in_readable
      1.86 ±  3%      -0.3        1.60            -0.4        1.50 ±  2%  perf-profile.self.cycles-pp.apparmor_file_permission
      1.42            -0.1        1.30            -0.1        1.31        perf-profile.self.cycles-pp.generic_write_checks
      2.43            -0.1        2.34            -0.2        2.22        perf-profile.self.cycles-pp.__cond_resched
      3.43            -0.1        3.36            -0.1        3.36        perf-profile.self.cycles-pp.generic_perform_write
      2.00            -0.1        1.93            -0.1        1.92 ±  2%  perf-profile.self.cycles-pp.down_write
      1.76            -0.1        1.69            -0.1        1.67        perf-profile.self.cycles-pp.generic_file_write_iter
      0.63 ±  2%      -0.1        0.56            -0.1        0.56        perf-profile.self.cycles-pp.xas_start
      6.51            -0.1        6.45            -0.4        6.08        perf-profile.self.cycles-pp.write
      0.77            -0.0        0.72            -0.0        0.77        perf-profile.self.cycles-pp.fault_in_iov_iter_readable
      1.28            -0.0        1.25            -0.1        1.20        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      0.90            -0.0        0.87            +0.0        0.92        perf-profile.self.cycles-pp.timestamp_truncate
      1.53            -0.0        1.51            +0.2        1.69        perf-profile.self.cycles-pp.inode_needs_update_time
      0.90            -0.0        0.88            -0.1        0.84        perf-profile.self.cycles-pp.aa_file_perm
      0.81            -0.0        0.79            -0.0        0.78        perf-profile.self.cycles-pp.generic_write_check_limits
      0.86            -0.0        0.84            +1.0        1.82        perf-profile.self.cycles-pp.rw_verify_area
      1.11            -0.0        1.10            -0.1        1.04        perf-profile.self.cycles-pp.security_file_permission
      1.42            -0.0        1.41            -0.1        1.36        perf-profile.self.cycles-pp.rcu_all_qs
      0.63            -0.0        0.62            -0.0        0.59        perf-profile.self.cycles-pp.x64_sys_call
      0.23 ±  2%      -0.0        0.22            -0.0        0.21        perf-profile.self.cycles-pp.noop_dirty_folio
      0.80            -0.0        0.80            -0.0        0.76        perf-profile.self.cycles-pp.balance_dirty_pages_ratelimited_flags
      0.12            -0.0        0.12 ±  3%      -0.0        0.10 ±  4%  perf-profile.self.cycles-pp.write@plt
      0.90            -0.0        0.90            -0.0        0.86        perf-profile.self.cycles-pp.simple_write_begin
      0.25            +0.0        0.25            -0.0        0.23        perf-profile.self.cycles-pp.__x64_sys_write
      2.75            +0.0        2.75            +0.0        2.79        perf-profile.self.cycles-pp.simple_write_end
      1.89            +0.0        1.90            -0.1        1.78        perf-profile.self.cycles-pp.do_syscall_64
      0.66            +0.0        0.66            +0.0        0.69        perf-profile.self.cycles-pp.file_update_time
      0.52            +0.0        0.53            -0.0        0.51        perf-profile.self.cycles-pp.folio_wait_stable
      0.86            +0.0        0.87            -0.0        0.85        perf-profile.self.cycles-pp.folio_mapping
      0.69            +0.0        0.70            +0.0        0.71        perf-profile.self.cycles-pp.security_inode_need_killpriv
      1.08            +0.0        1.09            -0.1        1.02        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.07            +0.0        0.09 ±  5%      +0.0        0.08 ±  7%  perf-profile.self.cycles-pp.update_min_vruntime
      0.77            +0.0        0.79            -0.0        0.73        perf-profile.self.cycles-pp.w_test
      0.00            +0.0        0.02 ± 99%      +0.1        0.05        perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      1.44            +0.0        1.47            -0.1        1.38        perf-profile.self.cycles-pp.ksys_write
      1.99            +0.0        2.04            +0.1        2.09        perf-profile.self.cycles-pp.file_remove_privs_flags
      1.57            +0.1        1.62            -0.0        1.53        perf-profile.self.cycles-pp.up_write
      1.33            +0.1        1.39            +0.0        1.36        perf-profile.self.cycles-pp.__vfs_getxattr
      0.09 ±  5%      +0.1        0.14 ±  5%      +0.1        0.15 ± 13%  perf-profile.self.cycles-pp.ktime_get
      4.27            +0.1        4.32            -0.2        4.08        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.49            +0.1        0.56            +0.0        0.53        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.14            +0.1        1.21            -0.1        1.00        perf-profile.self.cycles-pp.syscall_return_via_sysret
      6.90            +0.1        6.98            -0.1        6.78        perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      4.43            +0.1        4.52            -0.1        4.36        perf-profile.self.cycles-pp.__filemap_get_folio
      0.94            +0.1        1.03            +0.1        1.06        perf-profile.self.cycles-pp.strcmp
      0.62 ±  3%      +0.2        0.78 ±  2%      +0.5        1.11 ±  5%  perf-profile.self.cycles-pp.ktime_get_coarse_real_ts64
      3.49            +0.2        3.66            +1.5        4.97 ±  4%  perf-profile.self.cycles-pp.filemap_get_entry
      3.42            +0.2        3.65            +0.1        3.56        perf-profile.self.cycles-pp.__fsnotify_parent
      1.35            +0.3        1.66            +0.3        1.60        perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.92            +0.3        7.25            -0.3        6.64        perf-profile.self.cycles-pp.vfs_write
      1.29            +0.5        1.80            +0.4        1.74        perf-profile.self.cycles-pp.xas_load


> 
> Thanks,
> Amir.
> 
