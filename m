Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDC63DB658
	for <oe-lkp@lists.linux.dev>; Mon, 25 May 2026 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696532; cv=fail; b=hI6fJjExskNk7pyW5mPNxdFKzUqEHlT9KGbxjfU3H5Dx5P6sPqTQZN6Bu+tvytHoHvAO2f7qGvOSieiMjLyhpomsWPUJ3zbzLui/Gr8n3rKsc9b2SJmrux8Yxxf0D5bn0E/eSDb4rsoSga3UJC3paV0+56u9JceN90o8aTOMQeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696532; c=relaxed/simple;
	bh=Zvh0CwYKoqmJ6kZyE39FrLzyQJutvl30QWE0hQQoq+Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BTyLSnwTSx/CixZGU1SUwxcEoTWHT6kPIGBLRYWYl6s7E+zvympL7OdtSTzy9kzJCF03BBbqv4qfHim5vS4XkgYO4OKkdIXn7gICZWwUw1FcXG/FFcu4sIT1G8nIbdFv52eNRIZglz9Ap3zVDDNqa/epMg280kzHEh4UbbJkBro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XY6/UeJu; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY6/UeJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779696532; x=1811232532;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Zvh0CwYKoqmJ6kZyE39FrLzyQJutvl30QWE0hQQoq+Q=;
  b=XY6/UeJu1PBswNLJxaL/Mg0X5H0oEAZDZLdY7wZ4sQkCoCO6cr3cQMsZ
   FVX8517GmvOg4le+mW+9+g5BtgQDx8iScIRE2CpsGviYIZh/2b1OkQpjc
   VLFTLazJ7HcnDUW3daEd09vZNwpEkvxu3JE0Yo1iAUgIADtFTLabveLmL
   IU3Y5iHzxFWAm7mVrhB1NqsPka+C7xu3sPt78V3mIvn8F5NOGefHjnVRe
   5H18hYbFyxjnEMnGZwDGOh+/xNwf/gvqEav9+KIIsF3xLxsISvRGizvSb
   Zf/W4UKlypB3XJoTiT8zOaW9mH79sRD3mf582AxJ9IA11P6NsCYmhmjRP
   w==;
X-CSE-ConnectionGUID: /DUIbDdGSnC1/EtxhjcMRA==
X-CSE-MsgGUID: X4bZY4dJQL+6O0V/2COBUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="97942912"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="97942912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 01:08:51 -0700
X-CSE-ConnectionGUID: FHXz9jJ0Qt2JB+uyn0TDQA==
X-CSE-MsgGUID: sbH3sb0UQF6OrrS/+Yk+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="279649495"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 01:08:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 01:08:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 01:08:50 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.49)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 01:08:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpqTNkNPPNgjEOiZSOz7DUrSETXfvin27AqrfK79dZf4ngDnomSHpMHyWNPnSaphwV+r40/l0mEeEjPP/Jdb5/yZigvZr3UMa+KirdEW+jZYcXJyv2lwp5fj50dd6CcEvE0l6JVi4ufzmLiA0QOXt2GwaYx683eiDk8Qkt7DM1IgHFdvVLhaFbPY/at0n7V4HinsWsB3SkS8GohgdepVRqiuXhGluFITIkVx+DPHbsVh/Kn/bcXVotpvYlutATVlav49uf81b/qgFdWW2iTtQi8HmuGNNe19+zdDfZJ+1dDktJknDeokdf1p5imoY1+0InnN9uEQTF4givpEw8xePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlxwzyvBe8XrMnqHf6hbEU1C9uEG4uBGuReyhv/zaTI=;
 b=LjNQohIGrvQXfxrVwBcAik02BdIlC5hDwJwh+nZcWG9I3Sgzab/bj9CfezPp0bgidis6XbI+wdbcpf1LpGToq4Ak4+sFhkRsJNyiKQDHFMO0X3K3rR5seiMxbL0T15008IzXGdMgsrQFvtzt6ITkWJaOh1YhqSfnFXcAwDfNfUmOlvBswPaPrdwwxyABiFPLE+vBTh06VybeAb+g6reA5ZQVvpTo78QIWYx5BVF2lZQzGjb2+F7+1aSyF06f0UdGCWITiwdVWGP220Uu90GQBqR0PrWmvbstxlfFy0eneExopvrgdHkSa3yDXLYLQn3X9O8eUiZa+iQ333uGFdL6HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB8254.namprd11.prod.outlook.com (2603:10b6:806:251::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Mon, 25 May 2026 08:08:41 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 08:08:41 +0000
Message-ID: <beb3ab72-5689-4f82-bd41-4af29132a412@intel.com>
Date: Mon, 25 May 2026 16:08:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:sched/core] [sched/fair] c9d93a73ce:
 WARNING:suspicious_RCU_usage
To: Andrea Righi <arighi@nvidia.com>
CC: kernel test robot <oliver.sang@intel.com>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, K Prateek Nayak <kprateek.nayak@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <aubrey.li@linux.intel.com>
References: <202605232131.cfcd45a2-lkp@intel.com>
 <9e921b33-4029-4a75-82f2-ad2891e9d3d5@intel.com> <ahPO_v4_lYGagmcW@gpd4>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <ahPO_v4_lYGagmcW@gpd4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 031fb8d6-9c4b-4117-aac9-08deba34d524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: MNQOhjgURJhmMafNugtDc/K4hY8BEVoQ3cIZb3NET8iYjBPpLrUOu0TcE4K/dIonOffEnAjW1VOFirgUzEbH7Vcs0Wg6mf8CU1hZtkCaXCPL+7f/A5mMdZdJDroIa8r5UFJ9PZ8OiakPNBuQiWMyc7rjqGlF6XJyZzxDd3YEik6Ql3W9FpCtBdJeQ4ZfaFoYN1BlvOxYPqNbe38ZLTBBZjwbgKd4a3Eoq1MnlrrTInRT8aXn13dc9R3t3E30skNBiWbu/5fNo0PeRAEWROGBUqM9wGkAxkU6kVPZdxwUauGAfVUb+03pm6PqpzcMADMVpFXX4gHO/4Auy5d4O/QNAfi/OKTBzkHVNKiNQATkzcA91Am7E3YHMuCD/IO2lmhzXp9G6zu6wCvnl7JHnIeq/2IWeTDHdIhZAUazWwxjmurrE1SA4HzwXNnZTqbneQlGJs7KqQezoYU1W54WlJNZz0QzE51oI6YrmQ/2wxVkMDo4734LZZ3TsXSI/ri6luXpRif6noBHWa/ielLk+gZMHHz5v94jBTozmEmNaziEuKlHF4fIO5AwKPzadlx1Bo3TVIG0daUKRHBF3oXrHWzFulhtfXOlnCuHC7RY/KKXTB/MFKZiWC0n/dJ2xUOMKppiTyvBMO28oBBoaeBDyU/kZgExAn5SBf78eqiAmCUP/kb5sl4VnbvUMDDt499gTbYT97BDb8p8EvhA5+uVizfJuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTA5Y0p3cEQ5N0tIeUpCWDJMc3dtT1ZHL0dmTlNuSld5NnFLRjBHNVM3UDlL?=
 =?utf-8?B?blVTdkl6RDIyU2VNRmV6NWx1aTVVN1p5eSt5dWljU3ZTejBCaGVveU1obmhn?=
 =?utf-8?B?ZXh0UmdlUFZSUEcwSWRYWTl2ek1CU0hSR21GSVlDZzlEbk1MZGRRQmZqdUlL?=
 =?utf-8?B?dDlCQS9CaDZXMnIzRHpPbUFERm53MXBMTGZGSm84SnNEYTk4UjNvK2QwcTRQ?=
 =?utf-8?B?QzNEZkdzQkUzZXJrV2xva3Z5eWxkY0VLMkhSMGJIQTltRXZFeDdGY2JrRjZv?=
 =?utf-8?B?bEVaZEJRR2FTNnJjQVBXTkJCcXV1T0x2UDd0Zk1QUVU1d2VXdm1RNUR4aEdz?=
 =?utf-8?B?RGdTS1JKTjJORWU0WHlvb0tFUkNMN2F5Q1NQc0ZLKzcyWktYemhzOEtZdHlk?=
 =?utf-8?B?bmdTN3RHcStMR1RPb0psa3RmSEhmQTlLa2IydWdKRHhxUzc1RjRUYlI3bkZn?=
 =?utf-8?B?K2I2ZGUzdzVzR1U5NjN1RTBaYmhYc1Q3cG1reVVOZTNzOW5qNjVYYk81L2dD?=
 =?utf-8?B?cGZsdHB5VVNwaSszU01kSC82QXQxY0lua3JiTnovakJ3UmxuTzJYMGpHdkhy?=
 =?utf-8?B?aEE0VkhzenhNcEtodUwvT2dNOHg4Njk0cHlZUkZ5bXVLd3gvN25BRDVLdTBr?=
 =?utf-8?B?WVZqSUd0Z0JabFljOHFWZ3FEVnNDV2N2OXFxT2JTcEtsK3o1VFBLN2M2djUx?=
 =?utf-8?B?YmdhK284WDVNTnRHTWpoWnFzRzViWk9oQlZVamxHSi9xeVEza1NGaVRDTTlY?=
 =?utf-8?B?SStCRWw5ajhGakk0Tzk2V0NQblBCRFVFTWhCV3F3QzlmK1h4bGw0Q2JGQTJu?=
 =?utf-8?B?QzJqSmIzUWpqRmZiMWJvSTNUWmhBTmZJcnNBUmtPZlQyTHpVRnBxSHlic0R0?=
 =?utf-8?B?Z1hNeU5hb25UREZ4MHZKTGFOQUh3RFRRZUN3eStNMUxzSUx3clIxQWxxUC9k?=
 =?utf-8?B?UnN2NlFlZzNKVEpUc1FGUWRMQjZBaHgwUTJLWkJPVmgvdHJOa1E4RnZUUXox?=
 =?utf-8?B?a2IvZVhpMUsvbzl2MnN4RFE5VmVTUkFuY0FOU3Jic3JwdmVpaUNPQW5pREds?=
 =?utf-8?B?WXcxd0lQTm1DcVVPc0ZxNFdlUUtDRkdvdHJ0eHRXMXpBYTYrcnJPVFMvRGhD?=
 =?utf-8?B?Y3ZsUWNUUXlVTFowOG9TcGZsTWVnSENnT1pkTG45aUlOODZLZzhWSWNHT1VW?=
 =?utf-8?B?K2lxS041Q01MNTNYYWVEc2oxaDJJdjJHbzFvZkd1SVlrcEJmdnpVVXZmT2lt?=
 =?utf-8?B?VnJocXJ3dXhUUUoveXh5dEFZb0U0NldmMXNBaW15YTN5WU1VWXF4SjhSR1BT?=
 =?utf-8?B?amN6SWVVYXVlT21sZU5zd1FMcGUxOW13QVhXTnFhcWZUOVhJYzB1MXRQTFZO?=
 =?utf-8?B?NXlwanc3c3BGbW1JcEQ3dkhvSC84bndZakJleTdaeHpFZ1E5UjJCYWFHME9n?=
 =?utf-8?B?bVBRZ2FKZFM3TzYwSEtyUTRkTDBtTUhzMllsQ1NySFdGQlEwMEdGNDhzZ2ps?=
 =?utf-8?B?bVhESm9LUjBJY0M4VmI1WjNWT00vWWhJOUJ2L3BkeUZXb1FMTE9ydVpCK3Js?=
 =?utf-8?B?dUF1Nnl1VVpIMktna2RiWUl5NnR6ZVptVzFXTjh2MEVyS3dlWnJZa2lQaysw?=
 =?utf-8?B?aTRRekdnUGZ6ZklnU3FUdlMyU2U3bVl0WkJJOC9IZ0QwR25PaDF4WDZlUTl0?=
 =?utf-8?B?bm8wR1JENDMzK3RDQnFoV2tOc0VMbElDMU5FL25BVjRrT01qK2IzMHpmeXEr?=
 =?utf-8?B?Yi8wTVVTOFR3S1h6RzdPU3UyalFzZzBleWFMYTBSd0xpMVdGWW9wenovTTBL?=
 =?utf-8?B?V3VnYmFBdFR2UTdrcWRuc1NBNmQxakc1L2hUT3pGbmRiRGw5UDVCai82RHA1?=
 =?utf-8?B?enBOZFhRK3l1ejcxMDhTNVMxSHFuNEdzeHYrWUNGYmczOStXZFZYY2dXWXNQ?=
 =?utf-8?B?WTZ0bEYxSDVBYnlrd1NJeUg3NEtEQUFPcFMxeDkyT284MzB1dW1DcnZ1NW14?=
 =?utf-8?B?QjY0cWZ2N1JzTG1Mamp6TnBuRTdXN0VocHl5TWVnMit0YUJ6bHZra1pLUVFl?=
 =?utf-8?B?WWxEZDg0TFRncHFIZGVaWFpDK0lxNk54MStvSVNvdmtqTTgyZ2xVSkpGMnBi?=
 =?utf-8?B?Ykg2ZmlOTy9KVVpjZnNaTmZ5SFlLbERJVDRWcGhuS2VqelZNekU1S2owR3JC?=
 =?utf-8?B?MkdXWHhWVXM0eThmTU14SDlBZVJZMWcwdGRsTEMxRXIrWUtJNGRoelZvOTBx?=
 =?utf-8?B?cXdCMUsrSkZSbGZmUFRIZkRmTWdmS2Fsek5Ia1NDOWE1bEw4cUJ0WWhoUStL?=
 =?utf-8?B?Q1RkdHhHL2xCZStncS9jWExIVW5NT0oyUk1ickg1Ulo2SkpmQndpZz09?=
X-Exchange-RoutingPolicyChecked: OVqp9SHGrVRxP0F/Gy5yb0/WepFYId33qq0D+lkV88ACl/48bOHIm7VxxVWjZncS0u1VcNE0V+aMRZ6xhghmNQSBLdCAYAmOgaYVXFfsRlQTKjR1z3sCGv8wlpVS1wIFPgtRrAgOKNwxJO6sM8HMN3HYdwplcu7uGZ/+12ZQBDZLl8nl5leP9tQ+zwxPM7aePm4d5CUqkDBevMLlfLh548UJ7OGPz/1ppzynWai4g4XyI8t4NKSHPf125O7O6Wikyf45lXfGlpgBOwo7KhuPwCASGgXGdER47/YTi9i5/xSrpscAZVJy9gH0vDOnsdLA3BpGBEdK3n+xMZW85SKaAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 031fb8d6-9c4b-4117-aac9-08deba34d524
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 08:08:41.1339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FaISyrWITuGIykbhcjpWpizdGBKkvu4Ntm6ytwMHS7XmMnlKR3dTqvnawJ519plotE1zToLOWSvROGiFg1GNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8254
X-OriginatorOrg: intel.com

On 5/25/2026 12:24 PM, Andrea Righi wrote:
> Hello,
> 
> On Mon, May 25, 2026 at 09:53:22AM +0800, Chen, Yu C wrote:
>> On 5/23/2026 9:27 PM, kernel test robot wrote:
>>
>>>
>>> [  102.159951][   T23]
>>> [  102.160730][   T23] =============================
>>> [  102.162072][   T23] WARNING: suspicious RCU usage
>>> [  102.163398][   T23] 7.1.0-rc2-00011-gc9d93a73ce87 #1 Not tainted
>>> [  102.165064][   T23] -----------------------------
>>> [  102.167687][   T23] kernel/sched/fair.c:12793 suspicious rcu_dereference_check() usage!
>>> [  102.169994][   T23]
> 
> This should be fixed by
> https://lore.kernel.org/all/20260522092523.2046095-1-arighi@nvidia.com/
> 

Got it, thanks for the fix!

thanks,
Chenyu
