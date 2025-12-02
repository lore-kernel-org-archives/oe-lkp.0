Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81DF6BB5B
	for <oe-lkp@lists.linux.dev>; Tue,  2 Dec 2025 02:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644342; cv=fail; b=sP/FFhRPMr/J5+QNB/XmBRYpGH8m0gJv2qtnWu7QSwdeVP5DgSQx76oC3WZlysMIVb8PVgmBDumNrL4Fa3ZuA4pBpqRzccebzUW1IqKsBk2W7xJQRSS7/gk/LHAqeQrMERvB7YPV5/DoG5drG14cvlu5WCD5qnyAhWdj8UmJo1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644342; c=relaxed/simple;
	bh=XPd/xUKGIyAkI60slMwRSYgI8qHlCjFI87GfIMoZuTE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZXyg7PEgO18DB1XDs+A7eV0tHgoF77WDetssI+cS4YV86lME5iaVeAmgdhp4O8FAwG3w7+qR//mvb3at+YTs6je0CboXR/WXs3gmoDVea/ZccOdBE2a31eUN1/U+LAxRKWqtRehphVQgjh4gd/C0SxodVH9ATs6epEA1AEqehM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXc3t7jH; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXc3t7jH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764644340; x=1796180340;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XPd/xUKGIyAkI60slMwRSYgI8qHlCjFI87GfIMoZuTE=;
  b=LXc3t7jH03o9q1RaR/9BhtMnnkPhVYJ15AVfcbD0rWLPVRTShYFTXqTF
   rbHjXehhaRUntJucD960KyCCugjGmQ1TzeSeCA8q/AvxWd8hUsOJYXr3G
   U3Ux/jTSjNJrBTfNJaDp7F9OK15+3/KdNBVWtGs38phIgwkYyn+eEzj8Y
   9YE3Ya19v5DbcdIdx8Ix4a334wE9Zsh5m3jTsfMp1dPIEiPRS6OHSgqq/
   e15tj6gUt1BqHRdF22BXlBMNvCXzDh0EPzZDehyx0u0npe14WF4cScqpj
   QZ/xuNOaC/VQbNbYmUM//kGqrFNzDwxRcxog08Db9NgMcd6xxWxS997Fx
   A==;
X-CSE-ConnectionGUID: mKAAI4HER8WFaYZQScXh/Q==
X-CSE-MsgGUID: Hrgn6KEoSKCjZjsw6Q98NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66637300"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66637300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:59:00 -0800
X-CSE-ConnectionGUID: ZXdUH1oUSvifyPTLyqLMGg==
X-CSE-MsgGUID: ir5UwG03Rby4MUj5ZVX21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193528164"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:59:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:58:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:58:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:58:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b08LQa59eF98af7uJF6cldoRABfpxYfxx0Sc1Ke5TwBD7Jhb/EBWcjaCjHPfIp0lzuraETMJjvfApVo/MRAdg/9EgHhzP4kkdk8zRWLCoJ0SyujcpyPolYDtrq90oSYkSb0fWBZk7hAmp/xmDzKMoxAa1Nb09MMU4RY5SsP6yNiypQB6Z0BRBL9TOupjG3FvTYj96ao6EfKrQHTihTBfVDUme9cq5FGpTbbC+Leo5J8RMkbRt+S1Y69LMSGCffFKNU4iTnRAZ9E6VQ6HLgfeWPLzkMTiO8t2l+3HNaWJSuVd8jkNG7iBe+JAjkVQYxizEfsUEoEuFgw9hhpV0VR7eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpZtRlRhKUGgdjgix0H2TmfKnN+GzX+10FS9Iyx78nk=;
 b=Uf36xArY4S3aKTolWRwHuiifjCVYKFReEO8A1VF98x92k1WmlUnuJ64LnfSTZq+5so2RE3MlPu8cz3Be1TTHLkZcBf/dh14y/TcrhCHHWPF3p40vTIunphXPBiLvP3LNcPxr3thec5F+0DMIcoX+nDugDeMECE9ndTAosvWlfqWPYwaFwaqwb02bgnvSWUwpTkV+0S/WG9i3UR1fqreDypWlSCEAvVCoX69u9k7WfpETJa8JLnnvGc3Qfg+sMYIy7fzkB9wV0mXMLWeQRVESHPQhuMIs7tBoDq+x59dIngnIsPy5Jo+xODWcHVqcRqSrt8uueBeum0ifxW4Xg/siSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:58:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:58:50 +0000
Date: Tue, 2 Dec 2025 10:58:41 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>, <oe-lkp@lists.linux.dev>,
	<lkp@intel.com>, <linux-kernel@vger.kernel.org>, Borislav Petkov
	<bp@alien8.de>, Sean Christopherson <seanjc@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [x86] 284922f4c5: stress-ng.sockfd.ops_per_sec
 6.1% improvement
Message-ID: <aS5V4Xn9q32GDnnc@xsang-OptiPlex-9020>
References: <202511281306.51105b46-lkp@intel.com>
 <CAGudoHFTikYFRoJu2mRhNFv6GHPP4LNEDetMdsqkzAg1nTJfRA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHFTikYFRoJu2mRhNFv6GHPP4LNEDetMdsqkzAg1nTJfRA@mail.gmail.com>
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1a6b1c-44b4-41ee-c97b-08de314eb89e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vks1Z1psODdjOU5KbnlRYVFDVFdSQzByNnkxQTZYNW9nSGtjdnR4NThTZDVr?=
 =?utf-8?B?Qkk2K2tGOXJ1TWFlMnhEMUREY204QXI3TDJreEgyNUE2c1NkYjVCUGVqRFN0?=
 =?utf-8?B?YndUSnc2MnpoSGcyYnA0eFVrYXlIWlI3N1BndG5sbGhySG40Sk1LRyttUUFy?=
 =?utf-8?B?QjFoLzZRMXZoeHlrek96d1RjUVFWMTl4U3U2eHlyeTlXRUV1UFVFNnNPTmxm?=
 =?utf-8?B?dFBia3lPT3d3ekRJTWZoRFJ4Q2R3OERtZCthdEowQ0RBazBpdWZGR3ZuSWY3?=
 =?utf-8?B?V2szLy9vNFRxYWE3WktYQlVPbnZKcXo3Tm5rQ01hMm81MjJ4VlFZVUhIYTk5?=
 =?utf-8?B?QTd0NVhDZVpBa3FsZnB1VXpyWVVrVnZpcnFPbisyVDQvTDBFbFNtUFV2WGRs?=
 =?utf-8?B?TkdyTlpmSnpRU0FNTHNadTdzN053bUsvNVptaDhzN1kwVFhrVGJkakpRdWZS?=
 =?utf-8?B?QXlOODVNQ1dMb0NCVG15TGpNZlkwUW5QRUpZNm5UMnFPV25OQlJ2MFE4TWFh?=
 =?utf-8?B?TWUyajdFaUt3b2dzUGUrQnF0WWNxSVpBQ2ZVY1BTWTE1Q2JMWkFlQkxIeGFo?=
 =?utf-8?B?SGJzTVowUS9VTUI3cVNEbVQraUc5ZmdGNk9nWFJNOGZFV0FGbi9PQWwwd1VG?=
 =?utf-8?B?Y1ROMm1rZVl4TDdXdElHcTIxTCt5N25ndUhUSG5veW9OSHVBbjhxa3c0eVFr?=
 =?utf-8?B?clExa3pGektXMG93emJGZ2JiOHQ3UFpDR2hYQjZNcnBOSklBUlJrZlVpRm5Y?=
 =?utf-8?B?L0NlL3IrZmxkYlp3Z3R3c29UQ0FwbnN5aWdSRms4WVBJSjYxaFZRWXg5YUph?=
 =?utf-8?B?bGNwbnY0Q2RCdGcvWFZjMHR0VHU5UlJoS21taEJHUGg3YlErMHpXZHlGR3NJ?=
 =?utf-8?B?ZVpLRk5BV0cvYy9HVnFHdXVUQ2g4b1RKVWRnbG9tQURLQlVEdXFoc2k4ZUtl?=
 =?utf-8?B?K3JSWXN5RWNzN0hJQSs1bURhbzYyNGZOSkdIUVR3OFYwYVB6Q21iejhKN3A2?=
 =?utf-8?B?bzlrNGw5bEdJOFFGa1ErQjJoSStyb2E5N1JWOXVXcXFpd1M4cGJDRGtXcGJi?=
 =?utf-8?B?UVBTK2EzR0lZVFdoMWVHaDVCcDM1ajNYREE2Q2pJVTlUZDhvQU1FZjJPNWN0?=
 =?utf-8?B?OGdZS2tyZjRUYXMyYlp3MXh2U2NaWGh4VVhQWVVENndvNzRUa0pXK1ViYm1I?=
 =?utf-8?B?MFZibXhOb09ZeFZCTHRnb1pzK0Z2RFk4MXFWbG00RHBrTkVuaTVmenlFUTEz?=
 =?utf-8?B?bm5pVXdXTnFHa1QrWnZBeXRkZWZxeDVKTzZOTVVPS3pmUHdzb0FOQXdTa2Fs?=
 =?utf-8?B?c3ZZeGdWWkFKVnJGL09yM3RpbFptaGc5cXR2ZnVOMVhRei93Ymd5TmdmcjZR?=
 =?utf-8?B?VnZsTytDeS9abmZWSlppclNKRlJCN0JSUTRhQllyTG1DY01EalBERGlnUWxo?=
 =?utf-8?B?U2cyZUx1emxkdGRBWGtQQW1xa1NreXl2VFR5OC9aS1gwM3hZLzNzaXQ1RU1h?=
 =?utf-8?B?cTRwSnZjSGRuYVZDT1VrNEh6Z2ZQckNoaGlyb3MxRC9ZQll0RDJVTVpmaUFN?=
 =?utf-8?B?emxId285ekF6TTRpRWRLVnY3TVgrV01zczgrWWxKeGZ3T1RZbkhiMjNrRFRu?=
 =?utf-8?B?R09ZS2h0RmdXT0tBWlNYUzZZUEVlcDdvWG1QbmtOK0E3ZHRWSThhVmM3ZnNV?=
 =?utf-8?B?VS81OG15eFUzZFh2WGdaQXU5UEdZQ0xmZ3VxRGIzM3dxVDNmS1A0WVczMWtU?=
 =?utf-8?B?QVRMOWhJajJxTkNjREFGa0dvN2FTUEdLd0doVkFQN1lwTVdFZFpGTE43ZnE1?=
 =?utf-8?B?c09oYmJwb3UwcGozN01KQk1hcXRYRExJdm1Pc3lodElEL0RjditFOWVSc2Js?=
 =?utf-8?B?VFpWcGtXV3U4QWllY1pjTGlRRzJ5TFNPVjZCRDdGVlNUMStPV2ZTbXg0cFBh?=
 =?utf-8?B?VkpGT2FxMWZ5WmZuQWlQR0MramZMSmFudkcyd3ZsQkR4WXcrUVpnR2tLM21k?=
 =?utf-8?B?ampZT1VaUFd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFoYWdIWWNFTko0NlBYZ0xRaDhsRVBnNzB2Z2YvcUtNbSt2SzROaVJkK2Qv?=
 =?utf-8?B?bG1PSm9yZFhCdkpiU1pzVlpHZ2J6T3JMSlFOcEJSQnJGbHJuS04wRk1Zb2Rp?=
 =?utf-8?B?Wjk0K05GNmdGWEp5dGQwSVhYOTlBWEV3RjZqeTJBQWJPV3piTnVyZlY3UU8w?=
 =?utf-8?B?RCtpWmkzOHJaMDJVMnFpYjlVcE92ZFVPMkxoNVl2dWM4MUcvZWlDZXU0aHRS?=
 =?utf-8?B?cU1RZE5FVU5Jci9IRWh4UFNKRmNzakNFNW5Cd3pBNFV4M2NZWiszdFJrcTRH?=
 =?utf-8?B?bDBhTzNscHZINjljTExhbzcreG0wSmQ3Ri9pSC9WTmMvc0VUeEhlWGVOcUlM?=
 =?utf-8?B?czNpNlQyNnVOYU82dVVINHg5QTJ3WUVKYkQxTzI0eEVxbkVnSWpseWZIcjV5?=
 =?utf-8?B?TDA0alhtN2VTQ05BZ2JUZkRpV1JmU1haemZZRE4wWDI5Q295NHFFV2FNOU5M?=
 =?utf-8?B?a0hJTWk0ZUxaN0tyTmQxaVlyVDBWcnFBZjFBYXFTVE9KcnB3Wmd6eVZtVzBM?=
 =?utf-8?B?YnVRTjh2RFZBc1VNNk96dFowWklYVk0ydWdta05tR1VOUGRaU3hGd3haQWVY?=
 =?utf-8?B?NXppM0FRanRaUHQwL1NaTlJaRGRIdzAwZjdUb0pqdnFJNnN3c2V6R1hoeGMw?=
 =?utf-8?B?eGExZ1dRYmhUMTc5N25QNmJJdXNhNVY2dnBFQlU2cDJmWDNlbzIrUG9ydGpl?=
 =?utf-8?B?aUxaZ05mUGVmM1VJWEI0bnRWNTFwc1BGNFVMSWEva2RBcnJ6U0NHN1oxcERv?=
 =?utf-8?B?OHdERnlOVzdZRGZXdksrNlhpUlpIMlFVcTdxS0R4ZklJTi9TYWVKOGljTEkz?=
 =?utf-8?B?WjkvRldmbjBKYUxDbzBnbm9xZVF5aDVFczlPYjBqQ3MvdUd4bDdCdGlHeEhL?=
 =?utf-8?B?K2tpK1NhNHN6ZEt4U1lTVUNVdGVJL2Y2R1pIc0hBa1Z3VjhzZVVQWHZsWWtp?=
 =?utf-8?B?eWRNL2FTaTVoeGxWOW8yb1pNcDJzOUtYQnovMXdqajFhU1ErOExtMDRRM3I0?=
 =?utf-8?B?bHMzYU5QMUxLdG16eWViZkFCa21hOTFXVzVsV09hV0VTaDlrNktkM0tFUXdp?=
 =?utf-8?B?UGpWd0tENm5FMHprY0lXSmpTeldSMlNDalZOZUliNTVrM0dkdHJqNDI3Mjg5?=
 =?utf-8?B?R3FHN1hqbGgveXhuZ25RL3hiNktvR2pxd3VtVExtaXFweUdBTTQzRlE1ckdG?=
 =?utf-8?B?Y01CbWlwckg1dEtYanBiUURLVzFBeWhUUUJtWXZpRGxlSGdIYWdrWEVyVTVq?=
 =?utf-8?B?MFd1bno3Z3phZW9DcEpRZENCK2lOS1lIRWxyNis4MXc3MmNHdmFuMlNhMFhh?=
 =?utf-8?B?WHphNUd3RmdTY0VnL0FrVThtSzFKVEpQTitEWnBVWXA2a0dTeDRRV2IzYlR4?=
 =?utf-8?B?MTJQZWtrL0dVMXMvRmVLRzlOTzVJaWExVVNXZnk0Sk9kR3RMSFNDaFEyc0xi?=
 =?utf-8?B?U3hUbzVlbmtBM2dPUzFoSlB4NXdqNXlaTkRGam40VE1wcmdXczhyQzZYZ0JX?=
 =?utf-8?B?Zm5vWEdKOEFpOUoveVk1LzBwU3o2K0pEbWZaZXNCeGlaWktZL2ZSL3hXSFVa?=
 =?utf-8?B?dXk2RUQxYUtnK2JJOERUc2I3ZG5yanRyTzFFaCtuRVdoUnRqWHFYVVI0eXYy?=
 =?utf-8?B?cWxCc21iUHBiWWQxMEt0ZEU0ZGU5eStiQy9Xc3N6ejYrOThWazg5Nnk4d2tE?=
 =?utf-8?B?Ui92eXhmdU14TmVXZnFKRktBalJJQWZqWFA2ZkM5V0ZLVmE4d1daRHA1ZDNK?=
 =?utf-8?B?YjZhVXU3MTdFaHdGRWZtRnJISEY2L0ZRUnJZUXVnQ0JIeDNqaUpCM2xLaFRq?=
 =?utf-8?B?VzNXRjhET01PbkdpOUJLQmNpNnFSNWpIRlljVG0rcmUzb0JtTFpMM0NRVmla?=
 =?utf-8?B?ZGhzbnBzUnhMR0M1cXU2N0dFUTRTRDJ0V2YvQmx6Ky9CUmtraU9IdTYvdHA5?=
 =?utf-8?B?dGRvZUdVdFRzUGYwaGdnOU1KTzkzYTFhSC9wNHNvTlhFb3RxcE4xVTdYQm9n?=
 =?utf-8?B?R1pVaXlFSFFnaS9FSmlDVHVjdlM0cXo4dXVnUGJFalREYzRLV3Y1OHZwWnNz?=
 =?utf-8?B?empqbXNCODhjK2p3SGhTOVFCVC9GMlE1bjc3cjdaTkhkQWk2bWszTndsWjVK?=
 =?utf-8?B?WURxb2QvT0UrT204Ykt2NEVmUGRYZVZUMnZOazI3MHIzK1NwL3JQOHZxUkd5?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1a6b1c-44b4-41ee-c97b-08de314eb89e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:58:50.9134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xQtiyZib1iZD7MTqOwNSgxQUP+XukYfu4+G0FrjjxghWmtYUs0aLcP6MouF9P9JgYKhbkGTuYY8lWNCT0zjAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
X-OriginatorOrg: intel.com

hi, Mateusz Guzik,

On Fri, Nov 28, 2025 at 11:11:46AM +0100, Mateusz Guzik wrote:
> On Fri, Nov 28, 2025 at 7:30 AM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 6.1% improvement of stress-ng.sockfd.ops_per_sec on:
> >
> >
> > commit: 284922f4c563aa3a8558a00f2a05722133237fe8 ("x86: uaccess: don't use runtime-const rewriting in modules")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > testcase: stress-ng
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
> > parameters:
> >
> >         nr_threads: 100%
> >         testtime: 60s
> >         test: sockfd
> >         cpufreq_governor: performance
> >
> >
> >
> > Details are as below:
> > -------------------------------------------------------------------------------------------------->
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20251128/202511281306.51105b46-lkp@intel.com
> >
> > =========================================================================================
> > compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> >   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sockfd/stress-ng/60s
> >
> > commit:
> >   17d85f33a8 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma")
> >   284922f4c5 ("x86: uaccess: don't use runtime-const rewriting in modules")
> >
> > 17d85f33a83b84e7 284922f4c563aa3a8558a00f2a0
> > ---------------- ---------------------------
> >          %stddev     %change         %stddev
> >              \          |                \
> >   55674763            +6.1%   59075135        stress-ng.sockfd.ops
> >     927326            +6.1%     983845        stress-ng.sockfd.ops_per_sec
> >       3555 ±  3%     +10.6%       3932 ±  3%  perf-c2c.DRAM.remote
> >       4834 ±  3%     +12.0%       5415 ±  3%  perf-c2c.HITM.local
> >       2714 ±  2%     +12.5%       3054 ±  3%  perf-c2c.HITM.remote
> >       0.51            +3.9%       0.53        perf-stat.i.MPKI
> >   34903541            +5.2%   36715161        perf-stat.i.cache-misses
> >  1.072e+08            +5.8%  1.133e+08        perf-stat.i.cache-references
> >      18971            -5.5%      17932        perf-stat.i.cycles-between-cache-misses
> >       0.46 ± 30%     +13.6%       0.52        perf-stat.overall.MPKI
> >   31330827 ± 30%     +14.9%   36004895        perf-stat.ps.cache-misses
> >   96530576 ± 30%     +15.3%  1.113e+08        perf-stat.ps.cache-references
> >      48.32            -0.2       48.16        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
> >      48.23            -0.2       48.07        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg
> >      48.34            -0.2       48.18        perf-profile.calltrace.cycles-pp.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
> >       0.56 ±  4%      +0.1        0.65 ±  9%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
> >       0.62 ±  3%      +0.1        0.71 ±  8%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_sockfd
> >       0.56 ±  3%      +0.1        0.65 ±  8%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >      48.34            -0.2       48.18        perf-profile.children.cycles-pp.unix_del_edges
> >       0.15 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.__scm_recv_common
> >       0.08 ±  7%      +0.0        0.10 ±  7%  perf-profile.children.cycles-pp.lockref_put_return
> >       0.09 ±  5%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.__fput
> >       0.35 ±  5%      +0.1        0.43 ± 12%  perf-profile.children.cycles-pp.do_open
> >       0.63 ±  3%      +0.1        0.72 ±  8%  perf-profile.children.cycles-pp.do_sys_openat2
> >       0.56 ±  3%      +0.1        0.65 ±  8%  perf-profile.children.cycles-pp.do_filp_open
> >
> 
> While this may read suspicious as the change is supposed to be a nop
> for core kernel, it in fact is not as it adds:
> /* Used for modules: built-in code uses runtime constants */
> +unsigned long USER_PTR_MAX;
> +EXPORT_SYMBOL(USER_PTR_MAX);
> 
> this should probably be __ro_after_init.
> 
> The test at hand is heavily bottlenecked on the global lock in the
> garbage collector, which is not annotated with anything.
> 
> On my kernel I see this (nm vmlinux | sort -nk 1):
> ffffffff846c0a20 b bsd_socket_locks
> ffffffff846c0e20 b bsd_socket_buckets
> ffffffff846c1620 b unix_nr_socks
> ffffffff846c1628 b gc_in_progress
> ffffffff846c1630 b unix_graph_cyclic_sccs
> ffffffff846c1638 b unix_gc_lock <--- THE LOCK
> ffffffff846c1640 b unix_vertex_unvisited_index
> ffffffff846c1648 b unix_graph_state
> ffffffff846c1660 b unix_stream_bpf_prot
> ffffffff846c1820 b unix_stream_prot_lock
> ffffffff846c1840 b unix_dgram_bpf_prot
> ffffffff846c1a00 b unix_dgram_prot_lock
> 
> note how bsd_socket_buckets looks suspicious in its own right, but
> ignoring that bit, I'm guessing things got pushed around and it
> changed some of cacheline bouncing.
> 
> while a full fix is beyond the scope of this patch(tm), perhaps the
> annotation below will stabilize it against random breakage. can you
> guys bench it.

in our tests, below patch introduces more peformance improvements.

in our oiginal report, 284922f4c5 has a 6.1% performance improvement comparing
to parent 17d85f33a8.
we applied your patch directly upon 284922f4c5. as below, now by
"284922f4c5 + your patch"
we observe a 12.8% performance improvements (still comparing to 17d85f33a8).

full comparison is as below [1]

Tested-by: kernel test robot <oliver.sang@intel.com>


=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sockfd/stress-ng/60s

commit:
  17d85f33a8 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma")
  284922f4c5 ("x86: uaccess: don't use runtime-const rewriting in modules")
  c4f1335ec1 <---- patch

17d85f33a83b84e7 284922f4c563aa3a8558a00f2a0 c4f1335ec1491688ec229c5cf26
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
  55674763            +6.1%   59075135           +12.8%   62793623        stress-ng.sockfd.ops
    927326            +6.1%     983845           +12.8%    1045895        stress-ng.sockfd.ops_per_sec


> 
> diff --git a/net/unix/garbage.c b/net/unix/garbage.c
> index 78323d43e63e..25f65817faab 100644
> --- a/net/unix/garbage.c
> +++ b/net/unix/garbage.c
> @@ -199,7 +199,7 @@ static void unix_free_vertices(struct scm_fp_list *fpl)
>         }
>  }
> 
> -static DEFINE_SPINLOCK(unix_gc_lock);
> +static __cacheline_aligned_in_smp DEFINE_SPINLOCK(unix_gc_lock);
> 
>  void unix_add_edges(struct scm_fp_list *fpl, struct unix_sock *receiver)
>  {


[1]
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-spr-r02/sockfd/stress-ng/60s

commit: 
  17d85f33a8 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma")
  284922f4c5 ("x86: uaccess: don't use runtime-const rewriting in modules")
  c4f1335ec1 <---- patch

17d85f33a83b84e7 284922f4c563aa3a8558a00f2a0 c4f1335ec1491688ec229c5cf26
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     19.11            +0.1%      19.14            +1.4%      19.38        turbostat.RAMWatt
   9751559 ±  3%      -1.6%    9595510 ±  4%     -15.3%    8261973 ±  2%  proc-vmstat.pgalloc_normal
   8538105 ±  3%      -1.2%    8435833 ±  3%     -18.8%    6932658        proc-vmstat.pgfree
      3555 ±  3%     +10.6%       3932 ±  3%     +22.8%       4366 ±  8%  perf-c2c.DRAM.remote
      4834 ±  3%     +12.0%       5415 ±  3%     +20.3%       5813 ±  8%  perf-c2c.HITM.local
      2714 ±  2%     +12.5%       3054 ±  3%     +25.0%       3393 ±  8%  perf-c2c.HITM.remote
     64099 ± 30%     +17.2%      75129 ± 11%     +62.4%     104104 ±  8%  sched_debug.cpu.nr_switches.avg
    111196 ± 27%     +18.7%     131994 ±  7%     +48.0%     164614 ±  4%  sched_debug.cpu.nr_switches.max
     18142 ± 31%     +20.8%      21917 ± 11%     +52.6%      27692 ±  9%  sched_debug.cpu.nr_switches.stddev
  16326624 ±  7%      +6.8%   17434335 ± 11%     +47.3%   24056288 ±  8%  time.involuntary_context_switches
     27.78            +5.1%      29.18           +16.7%      32.42        time.user_time
  15140259 ±  8%      +7.8%   16319396 ± 12%     +51.9%   23004276 ±  9%  time.voluntary_context_switches
  55674763            +6.1%   59075135           +12.8%   62793623        stress-ng.sockfd.ops
    927326            +6.1%     983845           +12.8%    1045895        stress-ng.sockfd.ops_per_sec
  16326624 ±  7%      +6.8%   17434335 ± 11%     +47.3%   24056288 ±  8%  stress-ng.time.involuntary_context_switches
     27.78            +5.1%      29.18           +16.7%      32.42        stress-ng.time.user_time
  15140259 ±  8%      +7.8%   16319396 ± 12%     +51.9%   23004276 ±  9%  stress-ng.time.voluntary_context_switches
      0.51            +3.9%       0.53            +6.8%       0.55        perf-stat.i.MPKI
  34903541            +5.2%   36715161           +10.8%   38686195 ±  2%  perf-stat.i.cache-misses
 1.072e+08            +5.8%  1.133e+08            +8.0%  1.157e+08        perf-stat.i.cache-references
    518753 ±  7%      +7.6%     557957 ± 11%     +49.3%     774423 ±  8%  perf-stat.i.context-switches
      9.18            -1.0%       9.09            -3.4%       8.87        perf-stat.i.cpi
     18971            -5.5%      17932           -10.2%      17042        perf-stat.i.cycles-between-cache-misses
      2.34 ±  8%      +6.6%       2.50 ± 12%     +48.6%       3.48 ±  8%  perf-stat.i.metric.K/sec
      0.46 ± 30%     +13.6%       0.52           +16.8%       0.54        perf-stat.overall.MPKI
      0.10 ± 30%     +10.3%       0.11           +13.1%       0.11        perf-stat.overall.ipc
  31330827 ± 30%     +14.9%   36004895           +21.0%   37920039 ±  2%  perf-stat.ps.cache-misses
  96530576 ± 30%     +15.3%  1.113e+08           +17.7%  1.136e+08        perf-stat.ps.cache-references
    467600 ± 31%     +17.0%     546869 ± 12%     +62.5%     759773 ±  8%  perf-stat.ps.context-switches
 6.231e+10 ± 30%     +10.4%  6.876e+10           +13.0%  7.042e+10        perf-stat.ps.instructions
 3.809e+12 ± 30%     +10.4%  4.206e+12           +13.0%  4.305e+12        perf-stat.total.instructions
     48.32            -0.2       48.16            -0.2       48.13        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg
     48.23            -0.2       48.07            -0.2       48.04        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg
     48.34            -0.2       48.18            -0.2       48.15        perf-profile.calltrace.cycles-pp.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recvmsg.____sys_recvmsg
     49.18            -0.1       49.10            -1.7       47.47 ± 10%  perf-profile.calltrace.cycles-pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_sockfd
     49.07            -0.1       48.99            -0.2       48.83        perf-profile.calltrace.cycles-pp.unix_stream_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64
     49.17            -0.1       49.09            -1.7       47.46 ± 10%  perf-profile.calltrace.cycles-pp.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_sockfd
     49.11            -0.1       49.03            -0.2       48.88        perf-profile.calltrace.cycles-pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
     48.48            -0.1       48.40            -0.3       48.20        perf-profile.calltrace.cycles-pp.unix_add_edges.unix_stream_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg
     48.46            -0.1       48.39            -0.3       48.18        perf-profile.calltrace.cycles-pp._raw_spin_lock.unix_add_edges.unix_stream_sendmsg.____sys_sendmsg.___sys_sendmsg
     48.36            -0.1       48.30            -0.3       48.09        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_add_edges.unix_stream_sendmsg.____sys_sendmsg
      0.56 ±  4%      +0.1        0.65 ±  9%      +0.2        0.71 ± 13%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
      0.62 ±  3%      +0.1        0.71 ±  8%      +0.2        0.79 ± 12%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_sockfd
      0.56 ±  3%      +0.1        0.65 ±  8%      +0.2        0.72 ± 13%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
     97.46            -0.2       97.30            -0.4       97.10        perf-profile.children.cycles-pp._raw_spin_lock
     48.34            -0.2       48.18            -0.2       48.15        perf-profile.children.cycles-pp.unix_del_edges
     96.94            -0.1       96.80            -0.4       96.59        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     49.08            -0.1       49.00            -0.2       48.83        perf-profile.children.cycles-pp.unix_stream_sendmsg
     49.17            -0.1       49.09            -0.2       48.94        perf-profile.children.cycles-pp.___sys_sendmsg
     49.18            -0.1       49.10            -0.2       48.96        perf-profile.children.cycles-pp.__sys_sendmsg
     49.11            -0.1       49.03            -0.2       48.88        perf-profile.children.cycles-pp.____sys_sendmsg
     48.48            -0.1       48.40            -0.3       48.20        perf-profile.children.cycles-pp.unix_add_edges
      0.05            -0.0        0.05 ± 30%      +0.0        0.06 ±  4%  perf-profile.children.cycles-pp.arch_exit_to_user_mode_prepare
      0.05 ± 30%      -0.0        0.04 ± 46%      +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.sock_def_readable
      0.06            +0.0        0.06            +0.0        0.07        perf-profile.children.cycles-pp.alloc_empty_file
      0.00            +0.0        0.00            +0.1        0.05        perf-profile.children.cycles-pp.refill_obj_stock
      0.10 ±  4%      +0.0        0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__kmalloc_cache_noprof
      0.16 ±  9%      +0.0        0.16 ± 15%      +0.1        0.23 ± 12%  perf-profile.children.cycles-pp.__schedule
      0.16 ±  9%      +0.0        0.16 ± 15%      +0.1        0.23 ± 12%  perf-profile.children.cycles-pp.schedule
      0.17 ±  2%      +0.0        0.18 ±  3%      +0.0        0.20        perf-profile.children.cycles-pp.scm_fp_copy
      0.21            +0.0        0.21 ±  2%      +0.0        0.24        perf-profile.children.cycles-pp.__scm_send
      0.05            +0.0        0.05 ±  9%      +0.0        0.06        perf-profile.children.cycles-pp.__cond_resched
      0.07            +0.0        0.07 ±  6%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.copy_msghdr_from_user
      0.00            +0.0        0.00 ±331%      +0.1        0.05        perf-profile.children.cycles-pp.link_path_walk
      0.01 ±223%      +0.0        0.01 ±174%      +0.1        0.06 ± 11%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.06            +0.0        0.06 ±  7%      +0.0        0.07        perf-profile.children.cycles-pp.free_uid
      0.01 ±173%      +0.0        0.02 ±118%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.unix_scm_to_skb
      0.07 ±  6%      +0.0        0.08 ±  8%      +0.0        0.09 ±  6%  perf-profile.children.cycles-pp.__legitimize_path
      0.06 ±  6%      +0.0        0.07 ± 10%      +0.0        0.08 ±  7%  perf-profile.children.cycles-pp.terminate_walk
      0.15 ±  3%      +0.0        0.17 ±  2%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.__scm_recv_common
      0.00            +0.0        0.01 ±173%      +0.1        0.05        perf-profile.children.cycles-pp.kmem_cache_alloc_noprof
      0.16 ±  3%      +0.0        0.17 ±  4%      +0.0        0.18 ±  2%  perf-profile.children.cycles-pp.scm_recv_unix
      0.09 ±  7%      +0.0        0.10 ±  9%      +0.0        0.11 ±  6%  perf-profile.children.cycles-pp.dput
      0.08 ±  7%      +0.0        0.10 ±  7%      +0.0        0.11 ±  5%  perf-profile.children.cycles-pp.lockref_put_return
      0.09 ±  5%      +0.0        0.11 ±  6%      +0.0        0.12 ±  6%  perf-profile.children.cycles-pp.__fput
      0.15 ±  4%      +0.0        0.16 ±  4%      +0.0        0.18 ±  4%  perf-profile.children.cycles-pp.task_work_run
      0.16 ±  5%      +0.0        0.18 ±  6%      +0.0        0.19 ±  4%  perf-profile.children.cycles-pp.close_range
      0.24 ±  3%      +0.0        0.26 ±  6%      +0.1        0.32 ±  4%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
      0.19 ± 10%      +0.1        0.25 ± 18%      +0.1        0.29 ± 25%  perf-profile.children.cycles-pp.chrdev_open
      0.24 ±  8%      +0.1        0.31 ± 15%      +0.1        0.35 ± 21%  perf-profile.children.cycles-pp.do_dentry_open
      0.24 ±  7%      +0.1        0.32 ± 15%      +0.1        0.36 ± 20%  perf-profile.children.cycles-pp.vfs_open
      0.35 ±  5%      +0.1        0.43 ± 12%      +0.1        0.49 ± 15%  perf-profile.children.cycles-pp.do_open
      0.63 ±  3%      +0.1        0.72 ±  8%      +0.2        0.82 ±  9%  perf-profile.children.cycles-pp.do_sys_openat2
      0.63 ±  3%      +0.1        0.72 ±  8%      +0.2        0.82 ±  9%  perf-profile.children.cycles-pp.__x64_sys_openat
      0.56 ±  3%      +0.1        0.65 ±  9%      +0.2        0.74 ± 10%  perf-profile.children.cycles-pp.path_openat
      0.56 ±  3%      +0.1        0.65 ±  8%      +0.2        0.74 ± 10%  perf-profile.children.cycles-pp.do_filp_open
     96.49            -0.1       96.34            -0.3       96.14        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.06            +0.0        0.06 ±  4%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.scm_fp_copy
      0.00 ±331%      +0.0        0.01 ±173%      +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.unix_scm_to_skb
      0.08 ±  8%      +0.0        0.10 ±  8%      +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.lockref_put_return

