Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93D187FEA
	for <oe-lkp@lists.linux.dev>; Wed,  9 Oct 2024 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460352; cv=fail; b=KmlS7+RmLShiqQsERlZAFxf2K0vdrYjHyLuWKqQwMsZR8E8rbw3Xv1HByBnTpamm6TtmFWjRPBgibBHC2treNZEss6aypxxskSbB7SA1MDQF8Z9gH5GF9aD3oicnvL+ztgSI3goePLIPGTNcGKVbA8CJKq1zX9ncRMFU9Ns5aYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460352; c=relaxed/simple;
	bh=9q9hM2pZfWeA97G8g6yvj3g8GWntxs4SNhrhoSolOoY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LBPX/sc+YnLm3Go9NfniEEagNDYeJAq27U8zY6ogMl0HTKiJrkI1Vb+d2GmlmUeYHbdghwreXj9oKz6Ms4OihDGaziHbCce285H6064eDslMoMxoluu3tacuJd7wSSImMjFcpXerWWeFaFs6/mD/FCty0UyyZPw/N/SZw0lvuTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxRQ1E3j; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxRQ1E3j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728460350; x=1759996350;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9q9hM2pZfWeA97G8g6yvj3g8GWntxs4SNhrhoSolOoY=;
  b=JxRQ1E3jRjAy/Vs6hEYEOjsZ3b+5oTzj1WFUOlXVyguTaOEi1Gs5o/ok
   Mpz/SwObhMeQ56QBit5nDhT6+zvV3lgAOXN+VOZMUceDV7HOIJE3OVnmJ
   dN8pRLp2oYAixvWw0kg0ivzABw1KhWbn7W8vTA0plvfN3aJ/lYXWfIbmt
   JWXOIc9LosiTQ9jiOH4cIrMdm6BWJBIgVxtqy2gN2EztEz27YzTDMkw40
   oMlAmftZVIhK0wcClu8uGGoywZDzvdUglxMTK7eH37KJZO6PfCXhYr/n9
   L9uDOR+BJH1H+PeQYuQu+FzX7AGse4uoSExkpLD15NrdMRRouQBZU5KOf
   w==;
X-CSE-ConnectionGUID: X2oP19LcQuG0lw6WWRcANQ==
X-CSE-MsgGUID: M7+O5LsCR2+ND8XQYYrZ9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31443050"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="31443050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 00:52:29 -0700
X-CSE-ConnectionGUID: Q1OIlkgvRn+CeqYIhaZdBg==
X-CSE-MsgGUID: xtYRR0OJRgq94Am6UE+TVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="99488107"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Oct 2024 00:52:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:52:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 00:52:27 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 00:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKBpdJYnnkY2LPA5KdK5dheTKwj6MqNwYpxXTgzEO89NmScHZ8JRkvfQICUIawrJH/Vlw+tkXt6w8WW8Np0Mno3tIXy3kbBxOz5/D9jKq71n8EtOxypcpr35NFohqehyozJseCEDNeZtyRhz+Vchb9dqU9OTnMlhOx0aK6ge6jJEYSGhxJFazS0U3+P0/6RV5Y7ekR94OoCzBOzgQbsIkimpU6VtV3KCZa+qmbZ5+c5lIz1LR363w3pqJE0yTiFZGsX9CEAd0lzuKuwV7u/syLLGvPRvEy+JFdGZu0cWxv1jYo0dBX0kahluZVrDo/BFinraPYaR72JTAG+G9Fk/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGz8tlE/IVCw3L5cexdPlRbXn0IhTOLkmYwE3gQeCCc=;
 b=VSP0fQsDYOisMy6/6llte1hUvuIm0EIGeia1k8GHAqAQ3Ji84CHdkaOXyFwhSttPnhROSNzGttOtSqdQvtN8Ivj+c46aFltcVeNzWg/K8asl7jvSBQCjy4ov4Si6uUF25LroDsJMX7CSgsDVEa7KnyPdmHepZx5MQFH7JS9RoVJiKsaeosWBgdHWfHK2HsSUgV6GI2DVKXjFCEoZnbraMIzrPF4xkz9X0LF1a02SjlraE1uhUzP7IQ6mNyMpvIGiLofE84r05mwHCEYbhfUqCiVjZvF+9kbfHv/mePE2IDe4WcdWexVWT4GwfzAK7PKOcOvLfdgKYq181XlJTTPs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 by LV1PR11MB8842.namprd11.prod.outlook.com (2603:10b6:408:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 07:52:24 +0000
Received: from LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::2911:480b:49e5:2cda]) by LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::2911:480b:49e5:2cda%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 07:52:24 +0000
From: "Zheng, Wu" <wu.zheng@intel.com>
To: "Sang, Oliver" <oliver.sang@intel.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Jia, Pei P" <pei.p.jia@intel.com>
CC: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>
Subject: RE: [bytedance:5.15-velinux] [net]  c770815b03:
  netperf.Throughput_Mbps -70.4% regression
Thread-Topic: [bytedance:5.15-velinux] [net]  c770815b03:
  netperf.Throughput_Mbps -70.4% regression
Thread-Index: AQHbGh/ejpWZfuADs0u8M25kFF2WxLJ+C+8A
Date: Wed, 9 Oct 2024 07:52:24 +0000
Message-ID: <LV3PR11MB8507BB5E95A6044497C67A929D7F2@LV3PR11MB8507.namprd11.prod.outlook.com>
References: <202410091558.901d7359-oliver.sang@intel.com>
In-Reply-To: <202410091558.901d7359-oliver.sang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8507:EE_|LV1PR11MB8842:EE_
x-ms-office365-filtering-correlation-id: f86adc78-ff8e-43e1-8e3a-08dce837504e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?HoBncZqWM8kxA9/YT7ejMl3Aqb5gJBPt5oc4ev1/qT4KnraVBCrNEa3VAu?=
 =?iso-8859-1?Q?40lKHnE2t/m1jpp6gg6S9CGUFcXyxUmqfWk8uo0rohIFHwkdHNlzf1RQOb?=
 =?iso-8859-1?Q?veVI/bpNjW2mzMLiybNxjA4RIyvHdFcQQdxoXASqaRLWTBZuEWJNwaKSb8?=
 =?iso-8859-1?Q?utClvGR9xDBclO9eWtOK2YsMvx6N4e6xYNl/zwHQTr4az0sNEUAe5khww8?=
 =?iso-8859-1?Q?PJrUIpV3dIZ5cdEEnjOeAqhOEz29zfyfTK6frlBYmVOe4EgSh1/B0bUtUb?=
 =?iso-8859-1?Q?V3u/JSJo/WxOBFIg8ruUWTE9JviJmBeaFDqPrMTlvW7MvffgX+g50hkFzI?=
 =?iso-8859-1?Q?nPgKDvk82GXBH7MtpmL6g/cKKt4LUPRLWMabIldEAlSlMvo23h/YGYK6Bd?=
 =?iso-8859-1?Q?TFP7WjvMGdqVtGUfaEKpO8YKCPBjYiRmMUHfXamoKUQCjJG0kJXYpfFqQG?=
 =?iso-8859-1?Q?4D1FeqI9JbnN7FlVcdTW73oubi9+qIw1EjIf0Nor7XObX9Z8mGGktwbeAY?=
 =?iso-8859-1?Q?eGx+CMVHyIFq3pqOi9viiC5wGRByKJFj44/XNLpu+Bk/ct2otAyW58fEWU?=
 =?iso-8859-1?Q?27BJljDTdxb93wU4Ca2m+WiJ5hkRPARrUnXrlQV1aKeeoPnqLou593rF/n?=
 =?iso-8859-1?Q?w2Crzn5a2cQl4w8lKJsrUenGE5RCxqR3cObR0py7E22pd2REuavoRXdZJt?=
 =?iso-8859-1?Q?1aWMvS0jDPuTnZSsecKhhDKZ1D6YENu/6eb/93z+8JRNO0Kez32a4i9MPU?=
 =?iso-8859-1?Q?uxNISlkrIqzSdPJGDUEG6o2a22xVaqr8lFcAFklH0XfPXyqaDfnz7DK+T3?=
 =?iso-8859-1?Q?6kR0Zq7e6vTlYf9aOh1JspwxtzQC4ArTus3LbtfSNJbOs94b6Ve/bZJS0N?=
 =?iso-8859-1?Q?SrtWdyi10UKcY+a4C0TIZMrmuAAMV8UpiBorLl2lqtLCfwmBW3tG9IVwSc?=
 =?iso-8859-1?Q?8dmS0Rk0shbaA+25T0ELJssfW6Vs4IOg8zOjuWBEb3PGNGgkrkaQZFf43U?=
 =?iso-8859-1?Q?xvfFospzNDk7UtUIpnvSyubnykezM4vnxyJ62JBVS5/s0KFbRESY8WL0ZR?=
 =?iso-8859-1?Q?AGbA2GFQH25Lm1rG2DnCM1pNdFkLdOR0PoS8/Iz2b9ofLTemgWiXMpB37r?=
 =?iso-8859-1?Q?HBeYtAKvqo75aI1jhVlFpmc0rzMGjRMnIoCH7KA20M2ntPkcrWIU0pV5wR?=
 =?iso-8859-1?Q?1GEFXcPgGWk5hDZmbzF+5pD4ArXJ6CyUzo+4hlB28rftLeWiNoHkRegkmc?=
 =?iso-8859-1?Q?XnxFPuAF/jXWL5SpN7aZTrdfete62usSa72H2p5OlsdMOoqqD+o045USYU?=
 =?iso-8859-1?Q?cjzIDbwVLT8HNQkhvOEH0n7F3o+Rtqn2FaTH1ZpwLUyIBlE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8507.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3inMmAeZmt9j0yFfe5yz1NBLIdLApaEFIM0FswQ0JkkTOd9SC3WtCffYim?=
 =?iso-8859-1?Q?AmbgwWIM2BNPcWcdEhdwdP1txJaIbkElRvA89hVA9Hx03aF+HVdzCJpIBd?=
 =?iso-8859-1?Q?d6rjkATdtJIkP0+OEhZHjWEzrHyDjhdxGRmADJVMuqpEr+huxmuoov+//A?=
 =?iso-8859-1?Q?ag1UT1yrZPYmfu2ORhe3usKATDa0JQjbP8VkzEHk3bpVbwZrao0mDNVVs/?=
 =?iso-8859-1?Q?Tk+ZNA2jpz7lEvaOWBvfHxx4ChHhZrX1YU6BDoHtQU/TKZGNaGP9yzdDZ/?=
 =?iso-8859-1?Q?+kMt+PM0WuH8tLRdNWLiw8D2mCmApAL3ZnzOxQazfcLrPrzbcrLqnn5nJe?=
 =?iso-8859-1?Q?VoodQDBdtfFCmLg0c5Rc1NICLjHT2NMhCM+l/w7Tr5FbF4LBRnWLZm93Rn?=
 =?iso-8859-1?Q?6H4rAELSovHlynpqnHkATC9hIg39774o7WIBAL+6ZwZPl60h3c79Jj8XDC?=
 =?iso-8859-1?Q?N1CYNzmYEQgb016u3wBPIPpny9miCrTBlFZNvZTUGRJtNdvNPRXTji2Oo1?=
 =?iso-8859-1?Q?pLdi+j3MSkwspdET/vUAOO2WweD3n2SMjkfFaA/Pc1FehJNMW0S7leY175?=
 =?iso-8859-1?Q?DBKqnj24I/3BRUk/Nxqm0ArCcJ2T9PGgocFdvobyIsRncjm1krkH46ED9Z?=
 =?iso-8859-1?Q?mMYK8MbLQdl1/yGDGUfF+5sekUE7RmZSfSbpsE35/QITSTe/p315fJOeCb?=
 =?iso-8859-1?Q?Dw2xTlxP7HrJ4Akf3Btb/kOf5ZcbwQSaRbHJO3nVv4Uj3So1l0qhj6d2zZ?=
 =?iso-8859-1?Q?3AXWNYDyw4aYEPE/f9C34LiXwgTDP3M1/o9S5NLXX+MMErlGnzjyNorLBI?=
 =?iso-8859-1?Q?uPnv7IW7WmRexPfsDIC1n5I5C8jySEisM0Q6Q6SYpCh0of5dKbZTfoANn1?=
 =?iso-8859-1?Q?zhmYbyrTxBrGgzwBP8BzAzKn0vmu7MBnY6YhkexnkxuKPaqf4T3z4UC2FY?=
 =?iso-8859-1?Q?mkEAXYNTX1N1nkpk3YXf+j/1KlVwPoHlcgLayOWfu9qaRK2DdbzfVnevbL?=
 =?iso-8859-1?Q?gk00nE8zBu2Qj6dNazRMNHyDzGY+ADmzOVr5tVef5rjloaaUqZSzHCRi8g?=
 =?iso-8859-1?Q?hsO9zMZywh7/W3uoT5f0Ekcfilcd4tNJqF05KB+CPeVF4lt+FR9Y7jgERk?=
 =?iso-8859-1?Q?J8T5BtEmIt6hq0YH9g2MLHR4eQtP2NTuKJ+4TvrkFYr9R63XyKSB1jl+eC?=
 =?iso-8859-1?Q?XXbLQD3yJuJEyCxOUyBNzv0uHQV8vL8JdNT3Y76aXJaiC7d71un746di2n?=
 =?iso-8859-1?Q?tQq3yUrGmVIxkBn+wgsBxtlVO1oliMn28yCIn2FanroMxUJ/19d+KMtKFy?=
 =?iso-8859-1?Q?cY6IKLoYaz0LlN4osKtKw3ZSOJv5K76SuanYWjuPNYoma04k9ZMcHwiPup?=
 =?iso-8859-1?Q?EQTOd4CxgEAGz2q92eQcoDCvCg5WZUzQmQDDnipaNA0TIlLjaJwoktKrHJ?=
 =?iso-8859-1?Q?EpkfKlG0Pwi2jQgkjUPreK6EGSO827nRoA4A2AqbOsWErSRE018mECsuMv?=
 =?iso-8859-1?Q?cStTguuIDVMjyQa9ulrMe9BaxeSMDAvzAKmIAKNa9cfZnzwoddbpt05TEd?=
 =?iso-8859-1?Q?6mOkb++ePLc8pn6FzfFatK0m18bFrRZlkchKldWmst/gJxjspiLUNweb83?=
 =?iso-8859-1?Q?Xu7TztNSp5wJcAO1yzqKNZgSbm8JAWthR0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8507.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86adc78-ff8e-43e1-8e3a-08dce837504e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 07:52:24.7581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KuS65i9xzBHTIfElO1dWbFcph/wsBag5xOrHHMI31kSoJE1yeu4P2XjNIaxx4GukidOh6xFTdSAtvjBtJnJXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8842
X-OriginatorOrg: intel.com

Thanks for Oliver and will check it soon.

Best Regards
Zheng Wu

-----Original Message-----
From: Sang, Oliver <oliver.sang@intel.com>=20
Sent: Wednesday, October 9, 2024 3:50 PM
To: Zeng, Jason <jason.zeng@intel.com>; Zheng, Wu <wu.zheng@intel.com>; Jia=
, Pei P <pei.p.jia@intel.com>
Cc: oe-lkp@lists.linux.dev; lkp <lkp@intel.com>; Sang, Oliver <oliver.sang@=
intel.com>
Subject: [bytedance:5.15-velinux] [net] c770815b03: netperf.Throughput_Mbps=
 -70.4% regression



Hello,

kernel test robot noticed a -70.4% regression of netperf.Throughput_Mbps on=
:


commit: c770815b0360341459d9cd75c05e35d805396034 ("net: keep sk->sk_forward=
_alloc as small as possible")
https://github.com/bytedance/kernel.git 5.15-velinux

testcase: netperf
test machine: 240 threads 1 sockets Genuine Intel(R) 0000 (Granite Rapids) =
with 192G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 200%
	cluster: cs-localhost
	send_size: 10K
	test: TCP_SENDFILE
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091558.901d7359-oliver.sang@=
intel.com


Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091558.901d7359-oliv=
er.sang@intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send=
_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-bytedance-5.15-velinux/200%/d=
ebian-12-x86_64-20240206.cgz/300s/10K/lkp-gnr-1ap1/TCP_SENDFILE/netperf

commit:=20
  21346146a6 ("net: implement per-cpu reserves for memory_allocated")
  c770815b03 ("net: keep sk->sk_forward_alloc as small as possible")

21346146a624758f c770815b0360341459d9cd75c05=20
---------------- ---------------------------=20
         %stddev     %change         %stddev
             \          |                \ =20
  10283622 =B1  3%     -67.7%    3319999 =B1  7%  cpuidle..usage
  56762085           -70.8%   16546201 =B1  4%  vmstat.system.cs
    418699           -23.8%     319242        vmstat.system.in
     16.93           +15.1       32.03        mpstat.cpu.all.soft%
     75.87           -11.8       64.10        mpstat.cpu.all.sys%
      5.13            -3.3        1.83        mpstat.cpu.all.usr%
   2390248 =B1  7%     -63.1%     881603 =B1 37%  meminfo.Active
   2390248 =B1  7%     -63.1%     881603 =B1 37%  meminfo.Active(anon)
  12201984 =B1  3%     -13.1%   10600789 =B1  9%  meminfo.DirectMap2M
   2275446 =B1  7%     +47.7%    3361741 =B1  8%  meminfo.Inactive
   2275446 =B1  7%     +47.7%    3361741 =B1  8%  meminfo.Inactive(anon)
    790285 =B1  6%    +104.9%    1618912 =B1  3%  meminfo.Mapped
   3692511           -12.4%    3236269        meminfo.Shmem
      9429           -70.4%       2791 =B1  4%  netperf.ThroughputBoth_Mbps
   4525998           -70.4%    1340001 =B1  4%  netperf.ThroughputBoth_tota=
l_Mbps
      9429           -70.4%       2791 =B1  4%  netperf.Throughput_Mbps
   4525998           -70.4%    1340001 =B1  4%  netperf.Throughput_total_Mb=
ps
 8.789e+09           -70.8%  2.564e+09 =B1  4%  netperf.time.involuntary_co=
ntext_switches
     12892           +34.6%      17350        netperf.time.percent_of_cpu_t=
his_job_got
     37273           +40.7%      52455        netperf.time.system_time
      2027           -66.1%     686.98 =B1  3%  netperf.time.user_time
    115734 =B1  4%    +280.4%     440309 =B1 15%  netperf.time.voluntary_co=
ntext_switches
 1.657e+10           -70.4%  4.907e+09 =B1  4%  netperf.workload
    597017 =B1  7%     -63.1%     220377 =B1 37%  proc-vmstat.nr_active_ano=
n
    243768            +3.4%     252125        proc-vmstat.nr_anon_pages
   1805766            -6.3%    1691990        proc-vmstat.nr_file_pages
    568881 =B1  7%     +47.7%     840168 =B1  8%  proc-vmstat.nr_inactive_a=
non
    197471 =B1  6%    +105.0%     404831 =B1  4%  proc-vmstat.nr_mapped
    922571           -12.3%     808810        proc-vmstat.nr_shmem
     49622            -1.5%      48888        proc-vmstat.nr_slab_reclaimab=
le
    597017 =B1  7%     -63.1%     220377 =B1 37%  proc-vmstat.nr_zone_activ=
e_anon
    568881 =B1  7%     +47.7%     840168 =B1  8%  proc-vmstat.nr_zone_inact=
ive_anon
   2390109            -1.8%    2347422        proc-vmstat.numa_hit
   2390108            -1.8%    2347425        proc-vmstat.numa_local
   1024853           -40.5%     610287 =B1 55%  proc-vmstat.pgactivate
   2415096            -1.7%    2373030        proc-vmstat.pgalloc_normal
      0.02 =B1  7%     +39.9%       0.02 =B1  7%  perf-stat.i.MPKI
 1.874e+11           -68.0%      6e+10 =B1  3%  perf-stat.i.branch-instruct=
ions
      0.48            +0.0        0.51        perf-stat.i.branch-miss-rate%
 9.032e+08           -66.6%  3.017e+08 =B1  4%  perf-stat.i.branch-misses
      0.75 =B1  4%      +0.1        0.85 =B1  3%  perf-stat.i.cache-miss-ra=
te%
   1444223           -11.0%    1284879 =B1  5%  perf-stat.i.cache-misses
  2.55e+08 =B1  4%     -40.3%  1.523e+08 =B1  3%  perf-stat.i.cache-referen=
ces
  57419957           -71.0%   16662532 =B1  4%  perf-stat.i.context-switche=
s
      0.75          +261.9%       2.70 =B1  4%  perf-stat.i.cpi
 6.912e+11           +15.9%  8.011e+11        perf-stat.i.cpu-cycles
      3289 =B1  3%     -48.3%       1700 =B1  5%  perf-stat.i.cpu-migration=
s
  10711605 =B1  5%     -20.1%    8556489 =B1  9%  perf-stat.i.cycles-betwee=
n-cache-misses
 9.428e+11           -68.0%  3.017e+11 =B1  4%  perf-stat.i.instructions
      1.36           -71.8%       0.38 =B1  4%  perf-stat.i.ipc
    239.25           -71.0%      69.45 =B1  4%  perf-stat.i.metric.K/sec
      3500            +7.1%       3749 =B1  5%  perf-stat.i.minor-faults
      3502            +7.1%       3751 =B1  5%  perf-stat.i.page-faults
      5325 =B1222%    +642.2%      39521 =B1 44%  sched_debug.cfs_rq:/.MIN_=
vruntime.avg
   1277889 =B1222%    +642.2%    9484187 =B1 44%  sched_debug.cfs_rq:/.MIN_=
vruntime.max
     82319 =B1222%    +642.2%     610941 =B1 44%  sched_debug.cfs_rq:/.MIN_=
vruntime.stddev
      2.03            -9.8%       1.83        sched_debug.cfs_rq:/.h_nr_run=
ning.avg
      5325 =B1222%    +642.2%      39521 =B1 44%  sched_debug.cfs_rq:/.max_=
vruntime.avg
   1277889 =B1222%    +642.2%    9484187 =B1 44%  sched_debug.cfs_rq:/.max_=
vruntime.max
     82319 =B1222%    +642.2%     610941 =B1 44%  sched_debug.cfs_rq:/.max_=
vruntime.stddev
  36484567           -14.8%   31067726        sched_debug.cfs_rq:/.min_vrun=
time.avg
  31521338           -22.4%   24469834 =B1  7%  sched_debug.cfs_rq:/.min_vr=
untime.min
      2104           -10.6%       1881        sched_debug.cfs_rq:/.runnable=
_avg.avg
   -699055         +1031.3%   -7908282        sched_debug.cfs_rq:/.spread0.=
avg
   8414237 =B1 31%     -65.7%    2884598 =B1 93%  sched_debug.cfs_rq:/.spre=
ad0.max
  -5652697          +157.5%  -14558239        sched_debug.cfs_rq:/.spread0.=
min
    480.17 =B1 10%     -22.1%     373.83 =B1 13%  sched_debug.cfs_rq:/.util=
_avg.min
    300.42 =B1  4%     -10.3%     269.41 =B1  6%  sched_debug.cfs_rq:/.util=
_est_enqueued.stddev
    232246 =B1  5%     +95.6%     454184 =B1  6%  sched_debug.cpu.avg_idle.=
avg
      3347 =B1 61%    +206.5%      10259 =B1 35%  sched_debug.cpu.avg_idle.=
min
    237216 =B1 10%     +41.5%     335613 =B1  4%  sched_debug.cpu.avg_idle.=
stddev
     78.68 =B1 12%    +443.9%     427.95 =B1 26%  sched_debug.cpu.clock.std=
dev
     78.68 =B1 12%    +443.9%     427.95 =B1 26%  sched_debug.cpu.clock_tas=
k.stddev
      0.00 =B1 10%    +429.5%       0.00 =B1 25%  sched_debug.cpu.next_bala=
nce.stddev
      2.04           -10.5%       1.83        sched_debug.cpu.nr_running.av=
g
      0.56 =B1  2%      -9.3%       0.51 =B1  4%  sched_debug.cpu.nr_runnin=
g.stddev
  36236175           -76.5%    8506095 =B1  4%  sched_debug.cpu.nr_switches=
.avg
  37933773           -75.7%    9231670 =B1  3%  sched_debug.cpu.nr_switches=
.max
  32932632           -81.7%    6039483 =B1 13%  sched_debug.cpu.nr_switches=
.min
    838549 =B1  5%     -47.6%     439262 =B1  4%  sched_debug.cpu.nr_switch=
es.stddev
      0.02 =B1 82%    +562.5%       0.13 =B1 44%  perf-sched.sch_delay.avg.=
ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.s=
k_stream_alloc_skb
      1.09 =B1  2%     +65.5%       1.80 =B1  7%  perf-sched.sch_delay.avg.=
ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     17.62 =B1 10%     -28.1%      12.67 =B1 31%  perf-sched.sch_delay.avg.=
ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr=
_locked.__sched_setaffinity
      0.34 =B1  4%     +23.9%       0.42 =B1  8%  perf-sched.sch_delay.avg.=
ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      0.03 =B1 89%   +1028.0%       0.30 =B1 68%  perf-sched.sch_delay.max.=
ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.s=
k_stream_alloc_skb
      4422 =B1  8%     +22.6%       5420 =B1  8%  perf-sched.sch_delay.max.=
ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      5009 =B1  5%     +10.3%       5525 =B1  8%  perf-sched.sch_delay.max.=
ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mo=
de.do_syscall_64
    522.32 =B1219%     -99.1%       4.79 =B1 65%  perf-sched.sch_delay.max.=
ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.04 =B1 89%    +135.5%       0.08 =B1 51%  perf-sched.sch_delay.max.=
ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.57           +21.1%       0.69 =B1  7%  perf-sched.total_sch_delay.=
average.ms
      5012 =B1  5%     +12.6%       5644 =B1  7%  perf-sched.total_sch_dela=
y.max.ms
      1.73           +25.2%       2.16 =B1  7%  perf-sched.total_wait_and_d=
elay.average.ms
   4236094           -25.7%    3147248        perf-sched.total_wait_and_del=
ay.count.ms
     10025 =B1  5%     +12.6%      11289 =B1  7%  perf-sched.total_wait_and=
_delay.max.ms
      1.16           +27.3%       1.47 =B1  7%  perf-sched.total_wait_time.=
average.ms
      2.17 =B1  2%     +65.5%       3.59 =B1  7%  perf-sched.wait_and_delay=
.avg.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpa=
ge
     36.48 =B1  5%     -26.9%      26.68 =B1 24%  perf-sched.wait_and_delay=
.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowe=
d_ptr_locked.__sched_setaffinity
      1.24           +29.7%       1.61 =B1  8%  perf-sched.wait_and_delay.a=
vg.ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
    245.13 =B1  4%     -25.7%     182.04 =B1  4%  perf-sched.wait_and_delay=
.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    420624           -25.6%     312800        perf-sched.wait_and_delay.cou=
nt.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
    858.67 =B1 29%     -69.9%     258.50 =B1 16%  perf-sched.wait_and_delay=
.count.__cond_resched.__splice_from_pipe.generic_splice_sendpage.direct_spl=
ice_actor.splice_direct_to_actor
      4.50 =B1 37%     +77.8%       8.00 =B1 16%  perf-sched.wait_and_delay=
.count.__cond_resched.generic_perform_write.__generic_file_write_iter.gener=
ic_file_write_iter.new_sync_write
    420550           -25.7%     312576        perf-sched.wait_and_delay.cou=
nt.__cond_resched.kmem_cache_alloc_node.__alloc_skb.sk_stream_alloc_skb.tcp=
_build_frag
   1263718           -25.7%     938807        perf-sched.wait_and_delay.cou=
nt.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mo=
de.do_syscall_64
   2123814           -25.9%    1573595        perf-sched.wait_and_delay.cou=
nt.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      5324 =B1  4%     +29.6%       6901 =B1  7%  perf-sched.wait_and_delay=
.count.smpboot_thread_fn.kthread.ret_from_fork
      8844 =B1  8%     +22.6%      10840 =B1  8%  perf-sched.wait_and_delay=
.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpa=
ge
     10018 =B1  5%     +10.3%      11051 =B1  8%  perf-sched.wait_and_delay=
.max.ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_us=
er_mode.do_syscall_64
      0.02 =B1 82%    +562.5%       0.13 =B1 44%  perf-sched.wait_time.avg.=
ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.s=
k_stream_alloc_skb
      1.09 =B1  2%     +65.5%       1.80 =B1  7%  perf-sched.wait_time.avg.=
ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
     18.86           -25.8%      14.00 =B1 19%  perf-sched.wait_time.avg.ms=
.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr_l=
ocked.__sched_setaffinity
      0.90           +31.8%       1.19 =B1  8%  perf-sched.wait_time.avg.ms=
.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
    244.58 =B1  4%     -25.7%     181.77 =B1  4%  perf-sched.wait_time.avg.=
ms.smpboot_thread_fn.kthread.ret_from_fork
      0.03 =B1 89%   +1028.0%       0.30 =B1 68%  perf-sched.wait_time.max.=
ms.__cond_resched.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.s=
k_stream_alloc_skb
      4422 =B1  8%     +22.6%       5420 =B1  8%  perf-sched.wait_time.max.=
ms.__cond_resched.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      5009 =B1  5%     +10.3%       5525 =B1  8%  perf-sched.wait_time.max.=
ms.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mo=
de.do_syscall_64
      4873 =B1  6%     +15.0%       5603 =B1  7%  perf-sched.wait_time.max.=
ms.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
     37.53           -14.3       23.22        perf-profile.calltrace.cycles=
.accept_connection.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles=
.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles=
.process_requests.spawn_child.accept_connection.accept_connections.main
     37.53           -14.3       23.22        perf-profile.calltrace.cycles=
.spawn_child.accept_connection.accept_connections.main
     37.08           -14.0       23.06        perf-profile.calltrace.cycles=
.recv.process_requests.spawn_child.accept_connection.accept_connections
     36.24           -13.4       22.84        perf-profile.calltrace.cycles=
.entry_SYSCALL_64_after_hwframe.recv.process_requests.spawn_child.accept_co=
nnection
     36.12           -13.4       22.74        perf-profile.calltrace.cycles=
.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.process_requests.spawn_c=
hild
     33.60           -13.2       20.36        perf-profile.calltrace.cycles=
.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvf=
rom
     34.93           -13.2       21.71        perf-profile.calltrace.cycles=
.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.recv
     34.10           -13.2       20.93        perf-profile.calltrace.cycles=
.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64
     34.18           -13.0       21.16        perf-profile.calltrace.cycles=
.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
     33.74           -12.0       21.74        perf-profile.calltrace.cycles=
.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recv.proce=
ss_requests
     10.69            -8.0        2.74 =B1  4%  perf-profile.calltrace.cycl=
es.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvms=
g.inet_recvmsg
     10.72            -7.9        2.79 =B1  4%  perf-profile.calltrace.cycl=
es.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys=
_recvfrom
      6.88            -6.9        0.00        perf-profile.calltrace.cycles=
.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol=
_deliver_rcu
      6.74            -6.7        0.00        perf-profile.calltrace.cycles=
.__wake_up_common_lock.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.=
tcp_v4_rcv
      6.44            -6.4        0.00        perf-profile.calltrace.cycles=
.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_rcv_establish=
ed.tcp_v4_do_rcv
      8.60            -6.4        2.17 =B1  4%  perf-profile.calltrace.cycl=
es._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_loc=
ked.tcp_recvmsg
      6.26            -6.3        0.00        perf-profile.calltrace.cycles=
.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.tc=
p_rcv_established
      7.76            -5.8        1.97 =B1  3%  perf-profile.calltrace.cycl=
es.copy_user_enhanced_fast_string._copy_to_iter.__skb_datagram_iter.skb_cop=
y_datagram_iter.tcp_recvmsg_locked
     10.32            -5.5        4.86 =B1  2%  perf-profile.calltrace.cycl=
es.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      9.08            -4.7        4.36 =B1  2%  perf-profile.calltrace.cycl=
es.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg
      8.63            -4.5        4.17 =B1  2%  perf-profile.calltrace.cycl=
es.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg
      8.39            -4.3        4.07 =B1  2%  perf-profile.calltrace.cycl=
es.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
      8.15            -4.2        4.00 =B1  2%  perf-profile.calltrace.cycl=
es.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_data
     11.82            -4.1        7.70 =B1  2%  perf-profile.calltrace.cycl=
es.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage.inet_sendpage.ke=
rnel_sendpage
     11.77            -4.1        7.66 =B1  2%  perf-profile.calltrace.cycl=
es.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage.i=
net_sendpage
      5.88            -3.5        2.41 =B1  2%  perf-profile.calltrace.cycl=
es.generic_file_splice_read.splice_direct_to_actor.do_splice_direct.do_send=
file.__x64_sys_sendfile64
      9.28            -3.4        5.88        perf-profile.calltrace.cycles=
.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvf=
rom
     10.20            -3.2        7.04 =B1  2%  perf-profile.calltrace.cycl=
es.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendp=
ages.tcp_sendpage
      5.16            -3.0        2.16 =B1  2%  perf-profile.calltrace.cycl=
es.filemap_read.generic_file_splice_read.splice_direct_to_actor.do_splice_d=
irect.do_sendfile
      5.28            -3.0        2.28 =B1  9%  perf-profile.calltrace.cycl=
es.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mo=
de.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5.02            -3.0        2.03 =B1 10%  perf-profile.calltrace.cycl=
es.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_=
SYSCALL_64_after_hwframe.sendfile
      8.45            -2.9        5.59        perf-profile.calltrace.cycles=
.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_rec=
vmsg
      3.73            -2.7        1.04 =B1  2%  perf-profile.calltrace.cycl=
es.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_common_lock.s=
ock_def_readable
      3.69            -2.7        1.00 =B1  2%  perf-profile.calltrace.cycl=
es.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_up_=
common_lock
      4.42            -2.7        1.74 =B1  3%  perf-profile.calltrace.cycl=
es.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.s=
endfile.sendfile_tcp_stream
      9.22            -2.7        6.56 =B1  2%  perf-profile.calltrace.cycl=
es.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_fra=
mes.do_tcp_sendpages
      7.31            -2.6        4.75        perf-profile.calltrace.cycles=
.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_recvmsg_locked.tc=
p_recvmsg
      3.14            -2.2        0.92        perf-profile.calltrace.cycles=
.tcp_send_mss.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
      2.86            -2.0        0.81        perf-profile.calltrace.cycles=
.tcp_current_mss.tcp_send_mss.do_tcp_sendpages.tcp_sendpage.inet_sendpage
      3.08            -2.0        1.06 =B1  5%  perf-profile.calltrace.cycl=
es.recv
      5.49            -1.8        3.73        perf-profile.calltrace.cycles=
.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.=
tcp_recvmsg_locked
      2.90            -1.7        1.24        perf-profile.calltrace.cycles=
.sendfile
      3.14 =B1  2%      -1.6        1.51 =B1 14%  perf-profile.calltrace.cy=
cles.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit=
_to_user_mode.do_syscall_64
      3.02 =B1  2%      -1.5        1.47 =B1 15%  perf-profile.calltrace.cy=
cles.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode
      2.24            -1.3        0.97 =B1  2%  perf-profile.calltrace.cycl=
es.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.r=
ecv.process_requests
      2.19            -1.2        0.95 =B1  2%  perf-profile.calltrace.cycl=
es.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_=
SYSCALL_64_after_hwframe.recv
      1.96 =B1  2%      -1.2        0.80 =B1  2%  perf-profile.calltrace.cy=
cles.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up.__wake_=
up_common
      1.78            -1.1        0.67 =B1  2%  perf-profile.calltrace.cycl=
es.copy_page_to_iter.filemap_read.generic_file_splice_read.splice_direct_to=
_actor.do_splice_direct
      2.09            -1.0        1.07 =B1  3%  perf-profile.calltrace.cycl=
es.dequeue_task_fair.__schedule.schedule.schedule_timeout.wait_woken
      1.59            -0.9        0.73 =B1  2%  perf-profile.calltrace.cycl=
es.filemap_get_pages.filemap_read.generic_file_splice_read.splice_direct_to=
_actor.do_splice_direct
      1.51            -0.8        0.66 =B1  3%  perf-profile.calltrace.cycl=
es.psi_task_switch.__schedule.schedule.schedule_timeout.wait_woken
      1.40            -0.8        0.65 =B1  2%  perf-profile.calltrace.cycl=
es.filemap_get_read_batch.filemap_get_pages.filemap_read.generic_file_splic=
e_read.splice_direct_to_actor
      2.00            -0.7        1.31 =B1  2%  perf-profile.calltrace.cycl=
es.__alloc_skb.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages.tcp_send=
page
      1.30            -0.6        0.70        perf-profile.calltrace.cycles=
.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile
      1.30            -0.6        0.70        perf-profile.calltrace.cycles=
.entry_SYSCALL_64_after_hwframe.sendfile
      1.50 =B1  4%      -0.6        0.93        perf-profile.calltrace.cycl=
es.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tc=
p_recvmsg_locked
      0.78            -0.4        0.34 =B1 70%  perf-profile.calltrace.cycl=
es.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.s=
endfile
      1.08 =B1  2%      -0.4        0.66 =B1  2%  perf-profile.calltrace.cy=
cles.kmem_cache_alloc_node.__alloc_skb.sk_stream_alloc_skb.tcp_build_frag.d=
o_tcp_sendpages
      0.88            -0.4        0.53        perf-profile.calltrace.cycles=
.pick_next_task.__schedule.schedule.schedule_timeout.wait_woken
      0.63 =B1  2%      -0.1        0.57 =B1  2%  perf-profile.calltrace.cy=
cles.ip_rcv.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx=
_action
      1.37            +0.1        1.44 =B1  2%  perf-profile.calltrace.cycl=
es.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver=
_rcu
      0.96            +0.3        1.24        perf-profile.calltrace.cycles=
.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv
     11.21            +3.0       14.18        perf-profile.calltrace.cycles=
.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_=
push_pending_frames
      0.00            +3.7        3.73 =B1  2%  perf-profile.calltrace.cycl=
es.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.sk_stre=
am_alloc_skb.tcp_build_frag
     93.54            +3.7       97.26        perf-profile.calltrace.cycles=
.main
      0.00            +4.0        3.96 =B1  2%  perf-profile.calltrace.cycl=
es.try_to_wake_up.__wake_up_common.__wake_up_common_lock.sock_def_readable.=
tcp_data_queue
      0.00            +4.1        4.11 =B1  2%  perf-profile.calltrace.cycl=
es.__wake_up_common.__wake_up_common_lock.sock_def_readable.tcp_data_queue.=
tcp_rcv_established
      0.00            +4.2        4.21 =B1  2%  perf-profile.calltrace.cycl=
es.__wake_up_common_lock.sock_def_readable.tcp_data_queue.tcp_rcv_establish=
ed.tcp_v4_do_rcv
      0.00            +4.3        4.27 =B1  2%  perf-profile.calltrace.cycl=
es.sock_def_readable.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v=
4_rcv
      1.26            +4.5        5.80 =B1  2%  perf-profile.calltrace.cycl=
es.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
      1.10            +4.5        5.65 =B1  2%  perf-profile.calltrace.cycl=
es.skb_release_head_state.__kfree_skb.tcp_recvmsg_locked.tcp_recvmsg.inet_r=
ecvmsg
      0.00            +4.8        4.78 =B1  2%  perf-profile.calltrace.cycl=
es.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated=
.skb_release_head_state
      3.68            +4.8        8.46        perf-profile.calltrace.cycles=
.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.__release_sock=
.release_sock
      0.00            +4.8        4.79 =B1  2%  perf-profile.calltrace.cycl=
es.drain_stock.refill_stock.__sk_mem_reduce_allocated.skb_release_head_stat=
e.__kfree_skb
      3.66            +4.8        8.46        perf-profile.calltrace.cycles=
.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv=
.__release_sock
      0.00            +4.8        4.84 =B1  2%  perf-profile.calltrace.cycl=
es.refill_stock.__sk_mem_reduce_allocated.skb_release_head_state.__kfree_sk=
b.tcp_recvmsg_locked
      3.24            +5.1        8.32        perf-profile.calltrace.cycles=
.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_establ=
ished.tcp_v4_do_rcv
      2.94            +5.2        8.19        perf-profile.calltrace.cycles=
.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frame=
s.tcp_rcv_established
      0.00            +5.4        5.36 =B1  2%  perf-profile.calltrace.cycl=
es.__sk_mem_reduce_allocated.skb_release_head_state.__kfree_skb.tcp_recvmsg=
_locked.tcp_recvmsg
      2.33            +5.7        8.02        perf-profile.calltrace.cycles=
.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_send=
page
      0.00            +6.2        6.20 =B1  2%  perf-profile.calltrace.cycl=
es.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.__sk_me=
m_raise_allocated.__sk_mem_schedule
      0.00            +6.2        6.21        perf-profile.calltrace.cycles=
.try_charge_memcg.mem_cgroup_charge_skmem.sk_stream_alloc_skb.tcp_build_fra=
g.do_tcp_sendpages
      0.00            +6.3        6.30        perf-profile.calltrace.cycles=
.mem_cgroup_charge_skmem.sk_stream_alloc_skb.tcp_build_frag.do_tcp_sendpage=
s.tcp_sendpage
      5.11            +6.4       11.52 =B1  2%  perf-profile.calltrace.cycl=
es.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendpage.inet_sendpage
      4.74            +6.8       11.50 =B1  2%  perf-profile.calltrace.cycl=
es.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sendpa=
ge
      1.81            +8.4       10.23 =B1  3%  perf-profile.calltrace.cycl=
es.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock
      1.44 =B1  2%      +8.6       10.06 =B1  3%  perf-profile.calltrace.cy=
cles.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.__releas=
e_sock
      0.00            +9.7        9.75 =B1  3%  perf-profile.calltrace.cycl=
es.page_counter_uncharge.drain_stock.refill_stock.__sk_mem_reduce_allocated=
.tcp_clean_rtx_queue
      0.00            +9.8        9.76 =B1  3%  perf-profile.calltrace.cycl=
es.drain_stock.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.t=
cp_ack
      0.00            +9.8        9.81 =B1  3%  perf-profile.calltrace.cycl=
es.refill_stock.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_r=
cv_established
      0.00            +9.9        9.88 =B1  2%  perf-profile.calltrace.cycl=
es.try_charge_memcg.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_m=
em_schedule.tcp_build_frag
      0.00           +10.2       10.20 =B1  3%  perf-profile.calltrace.cycl=
es.__sk_mem_reduce_allocated.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_establishe=
d.tcp_v4_do_rcv
      0.00           +10.5       10.48 =B1  2%  perf-profile.calltrace.cycl=
es.mem_cgroup_charge_skmem.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_b=
uild_frag.do_tcp_sendpages
      0.00           +10.7       10.67 =B1  2%  perf-profile.calltrace.cycl=
es.__sk_mem_raise_allocated.__sk_mem_schedule.tcp_build_frag.do_tcp_sendpag=
es.tcp_sendpage
      0.00           +10.7       10.70 =B1  2%  perf-profile.calltrace.cycl=
es.__sk_mem_schedule.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_send=
page
      8.64           +11.2       19.88        perf-profile.calltrace.cycles=
.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
      7.57           +11.9       19.47        perf-profile.calltrace.cycles=
.__release_sock.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage
      4.19           +12.8       17.02        perf-profile.calltrace.cycles=
.tcp_write_xmit.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
      3.74           +13.1       16.87        perf-profile.calltrace.cycles=
.__tcp_transmit_skb.tcp_write_xmit.do_tcp_sendpages.tcp_sendpage.inet_sendp=
age
      0.00           +13.2       13.17 =B1  2%  perf-profile.calltrace.cycl=
es.page_counter_try_charge.try_charge_memcg.mem_cgroup_charge_skmem.tcp_dat=
a_queue.tcp_rcv_established
      3.38           +13.4       16.74        perf-profile.calltrace.cycles=
.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.do_tcp_sendpages.tcp_sen=
dpage
      3.14           +13.5       16.65        perf-profile.calltrace.cycles=
.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.do_tcp=
_sendpages
     17.19           +15.5       32.71        perf-profile.calltrace.cycles=
.do_softirq.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_tr=
ansmit_skb
      4.05           +15.5       19.60        perf-profile.calltrace.cycles=
.tcp_build_frag.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage
     16.89           +15.7       32.54        perf-profile.calltrace.cycles=
.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_output=
2.__ip_queue_xmit
     16.58           +15.8       32.40        perf-profile.calltrace.cycles=
.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip=
_finish_output2
     16.30           +15.8       32.13        perf-profile.calltrace.cycles=
.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_=
enable_ip
     16.23           +15.9       32.10        perf-profile.calltrace.cycles=
.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_start.do_sof=
tirq
     15.43           +16.4       31.81        perf-profile.calltrace.cycles=
.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_action.__s=
oftirqentry_text_start
     13.51           +16.9       30.44        perf-profile.calltrace.cycles=
.ip_local_deliver_finish.__netif_receive_skb_one_core.process_backlog.__nap=
i_poll.net_rx_action
     13.48           +16.9       30.43        perf-profile.calltrace.cycles=
.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_skb_one_co=
re.process_backlog.__napi_poll
     13.28           +17.1       30.34        perf-profile.calltrace.cycles=
.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive=
_skb_one_core.process_backlog
     11.78           +17.2       29.00        perf-profile.calltrace.cycles=
.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.__tcp_transmit_skb.=
tcp_write_xmit
     55.96           +18.0       73.95        perf-profile.calltrace.cycles=
.sendfile_tcp_stream.main
     10.33           +18.4       28.70        perf-profile.calltrace.cycles=
.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_lo=
cal_deliver_finish
     10.58           +18.4       28.96        perf-profile.calltrace.cycles=
.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish._=
_netif_receive_skb_one_core
     54.87           +18.7       73.59        perf-profile.calltrace.cycles=
.sendfile.sendfile_tcp_stream.main
     53.36           +19.7       73.10        perf-profile.calltrace.cycles=
.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream.main
     53.05           +20.0       73.02        perf-profile.calltrace.cycles=
.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile.sendfile_tcp_stream.=
main
      0.00           +21.1       21.06 =B1  2%  perf-profile.calltrace.cycl=
es.try_charge_memcg.mem_cgroup_charge_skmem.tcp_data_queue.tcp_rcv_establis=
hed.tcp_v4_do_rcv
      0.00           +21.3       21.26 =B1  2%  perf-profile.calltrace.cycl=
es.mem_cgroup_charge_skmem.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv=
.tcp_v4_rcv
     24.09           +21.5       45.62        perf-profile.calltrace.cycles=
.do_tcp_sendpages.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage
     48.29           +22.9       71.19        perf-profile.calltrace.cycles=
.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendfile=
.sendfile_tcp_stream
     47.51           +23.3       70.80        perf-profile.calltrace.cycles=
.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.sendfile
     45.62           +24.5       70.15        perf-profile.calltrace.cycles=
.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
     45.45           +24.7       70.10        perf-profile.calltrace.cycles=
.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfile64.d=
o_syscall_64
      0.00           +26.4       26.36        perf-profile.calltrace.cycles=
.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_de=
liver_rcu
     38.38           +28.9       67.32        perf-profile.calltrace.cycles=
.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfile.__=
x64_sys_sendfile64
     38.26           +29.0       67.29        perf-profile.calltrace.cycles=
.generic_splice_sendpage.direct_splice_actor.splice_direct_to_actor.do_spli=
ce_direct.do_sendfile
     37.93           +29.2       67.17        perf-profile.calltrace.cycles=
.__splice_from_pipe.generic_splice_sendpage.direct_splice_actor.splice_dire=
ct_to_actor.do_splice_direct
     36.27           +30.3       66.56        perf-profile.calltrace.cycles=
.pipe_to_sendpage.__splice_from_pipe.generic_splice_sendpage.direct_splice_=
actor.splice_direct_to_actor
     35.97           +30.5       66.45        perf-profile.calltrace.cycles=
.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.generic_splice_sendpage.=
direct_splice_actor
     35.83           +30.6       66.39        perf-profile.calltrace.cycles=
.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.generic_=
splice_sendpage
     35.53           +30.8       66.30        perf-profile.calltrace.cycles=
.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from=
_pipe
     35.06           +31.1       66.16        perf-profile.calltrace.cycles=
.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage
     40.15           -16.0       24.12        perf-profile.children.cycles.=
recv
     37.53           -14.3       23.22        perf-profile.children.cycles.=
accept_connection
     37.53           -14.3       23.22        perf-profile.children.cycles.=
accept_connections
     37.53           -14.3       23.22        perf-profile.children.cycles.=
process_requests
     37.53           -14.3       23.22        perf-profile.children.cycles.=
spawn_child
     35.04           -12.9       22.14        perf-profile.children.cycles.=
__x64_sys_recvfrom
     33.60           -12.8       20.76        perf-profile.children.cycles.=
tcp_recvmsg_locked
     34.93           -12.8       22.11        perf-profile.children.cycles.=
__sys_recvfrom
     34.10           -12.8       21.34        perf-profile.children.cycles.=
tcp_recvmsg
     34.18           -12.6       21.56        perf-profile.children.cycles.=
inet_recvmsg
     10.69            -8.0        2.74 =B1  4%  perf-profile.children.cycle=
s.__skb_datagram_iter
     10.72            -7.9        2.79 =B1  4%  perf-profile.children.cycle=
s.skb_copy_datagram_iter
      8.60            -6.4        2.17 =B1  4%  perf-profile.children.cycle=
s._copy_to_iter
     13.13            -6.1        7.02 =B1  2%  perf-profile.children.cycle=
s.__schedule
      8.00            -5.8        2.16        perf-profile.children.cycles.=
copy_user_enhanced_fast_string
     11.53            -5.4        6.16 =B1  2%  perf-profile.children.cycle=
s.schedule
     10.32            -5.1        5.26 =B1  2%  perf-profile.children.cycle=
s.sk_wait_data
      9.08            -4.3        4.76 =B1  2%  perf-profile.children.cycle=
s.wait_woken
      7.44            -4.2        3.22 =B1  2%  perf-profile.children.cycle=
s.syscall_exit_to_user_mode
      7.21            -4.1        3.15 =B1  2%  perf-profile.children.cycle=
s.exit_to_user_mode_prepare
      8.63            -4.1        4.57 =B1  2%  perf-profile.children.cycle=
s.schedule_timeout
      5.88            -3.5        2.41 =B1  2%  perf-profile.children.cycle=
s.generic_file_splice_read
      5.16            -3.0        2.16 =B1  2%  perf-profile.children.cycle=
s.filemap_read
      5.28            -2.8        2.45 =B1  2%  perf-profile.children.cycle=
s.exit_to_user_mode_loop
      6.88            -2.6        4.26 =B1  2%  perf-profile.children.cycle=
s.sock_def_readable
      6.74            -2.5        4.21 =B1  2%  perf-profile.children.cycle=
s.__wake_up_common_lock
      6.44            -2.3        4.11 =B1  2%  perf-profile.children.cycle=
s.__wake_up_common
      6.26            -2.3        3.96 =B1  2%  perf-profile.children.cycle=
s.try_to_wake_up
      3.14            -2.2        0.92        perf-profile.children.cycles.=
tcp_send_mss
      2.98            -2.1        0.86        perf-profile.children.cycles.=
tcp_current_mss
      3.69            -1.9        1.75 =B1  2%  perf-profile.children.cycle=
s.enqueue_task
      3.73            -1.9        1.80 =B1  2%  perf-profile.children.cycle=
s.ttwu_do_activate
      2.19            -1.8        0.42 =B1  3%  perf-profile.children.cycle=
s.ipv4_mtu
      2.26            -1.6        0.69 =B1  4%  perf-profile.children.cycle=
s.load_new_mm_cr3
      3.08            -1.5        1.54 =B1  2%  perf-profile.children.cycle=
s.switch_mm_irqs_off
      2.64            -1.4        1.28 =B1  3%  perf-profile.children.cycle=
s.__cond_resched
      2.26            -1.2        1.03 =B1  3%  perf-profile.children.cycle=
s._raw_spin_lock_bh
      1.41 =B1  2%      -1.2        0.20 =B1  4%  perf-profile.children.cyc=
les.dst_release
      2.97            -1.2        1.78 =B1  2%  perf-profile.children.cycle=
s.__alloc_skb
      1.62            -1.1        0.50 =B1  3%  perf-profile.children.cycle=
s.switch_fpu_return
      1.92            -1.1        0.79 =B1  3%  perf-profile.children.cycle=
s.psi_task_switch
      1.78            -1.1        0.67 =B1  2%  perf-profile.children.cycle=
s.copy_page_to_iter
      3.63 =B1  4%      -1.1        2.54        perf-profile.children.cycle=
s.__dev_queue_xmit
      1.44            -1.1        0.36 =B1  5%  perf-profile.children.cycle=
s.__rseq_handle_notify_resume
      2.41 =B1  2%      -1.1        1.36 =B1  2%  perf-profile.children.cyc=
les.enqueue_task_fair
      1.70            -1.0        0.66 =B1  4%  perf-profile.children.cycle=
s.psi_group_change
      1.82 =B1  2%      -1.0        0.80 =B1  2%  perf-profile.children.cyc=
les.update_curr
      2.09            -1.0        1.08 =B1  2%  perf-profile.children.cycle=
s.dequeue_task_fair
      2.07            -1.0        1.05 =B1  2%  perf-profile.children.cycle=
s.pick_next_task
      1.34            -1.0        0.33 =B1  3%  perf-profile.children.cycle=
s.restore_fpregs_from_fpstate
      1.96            -1.0        0.96 =B1  2%  perf-profile.children.cycle=
s.pick_next_task_fair
      1.39            -1.0        0.40 =B1  4%  perf-profile.children.cycle=
s.ktime_get
      1.28            -0.9        0.35 =B1  5%  perf-profile.children.cycle=
s.simple_copy_to_iter
      1.59            -0.9        0.73 =B1  2%  perf-profile.children.cycle=
s.filemap_get_pages
      1.53            -0.9        0.67 =B1  3%  perf-profile.children.cycle=
s.update_load_avg
      1.18            -0.9        0.32 =B1  5%  perf-profile.children.cycle=
s.__check_object_size
      1.74 =B1  7%      -0.8        0.93 =B1  2%  perf-profile.children.cyc=
les.dev_hard_start_xmit
      1.56            -0.8        0.75 =B1  2%  perf-profile.children.cycle=
s.skb_release_data
      1.31            -0.8        0.50 =B1  4%  perf-profile.children.cycle=
s._raw_spin_lock
      1.68 =B1  8%      -0.8        0.88 =B1  2%  perf-profile.children.cyc=
les.xmit_one
      1.54 =B1  8%      -0.8        0.78 =B1  2%  perf-profile.children.cyc=
les.loopback_xmit
      1.40            -0.8        0.65 =B1  2%  perf-profile.children.cycle=
s.filemap_get_read_batch
      1.04            -0.7        0.29 =B1  4%  perf-profile.children.cycle=
s.__entry_text_start
      1.08            -0.7        0.34 =B1  3%  perf-profile.children.cycle=
s.touch_atime
      0.99            -0.7        0.25 =B1  4%  perf-profile.children.cycle=
s.rseq_ip_fixup
      1.04            -0.7        0.31 =B1  5%  perf-profile.children.cycle=
s.__switch_to_asm
      0.98 =B1  2%      -0.7        0.26 =B1  3%  perf-profile.children.cyc=
les.ipv4_dst_check
      0.98            -0.7        0.29 =B1  4%  perf-profile.children.cycle=
s.save_fpregs_to_fpstate
      0.96            -0.7        0.30 =B1  4%  perf-profile.children.cycle=
s.psi_task_change
      0.90            -0.6        0.26 =B1  4%  perf-profile.children.cycle=
s.__fget_light
      1.47            -0.6        0.83 =B1  2%  perf-profile.children.cycle=
s.kmem_cache_alloc_node
      1.00 =B1  3%      -0.6        0.37 =B1  4%  perf-profile.children.cyc=
les.dequeue_entity
      0.85            -0.6        0.22 =B1  5%  perf-profile.children.cycle=
s.read_tsc
      1.25            -0.6        0.62 =B1  3%  perf-profile.children.cycle=
s.lock_sock_nested
      0.86            -0.6        0.25 =B1  2%  perf-profile.children.cycle=
s.atime_needs_update
      0.84            -0.6        0.24 =B1  4%  perf-profile.children.cycle=
s.kmem_cache_free
      0.84            -0.6        0.25 =B1  3%  perf-profile.children.cycle=
s.tcp_mstamp_refresh
      0.88            -0.6        0.29 =B1  3%  perf-profile.children.cycle=
s._raw_spin_lock_irqsave
      1.42 =B1  2%      -0.6        0.83 =B1  2%  perf-profile.children.cyc=
les.ip_rcv
      0.90            -0.6        0.33 =B1  4%  perf-profile.children.cycle=
s.sched_clock_cpu
      0.80            -0.5        0.26 =B1  2%  perf-profile.children.cycle=
s.native_sched_clock
      0.72            -0.5        0.19 =B1  4%  perf-profile.children.cycle=
s.__put_user_nocheck_8
      1.23 =B1  5%      -0.5        0.71 =B1  3%  perf-profile.children.cyc=
les.enqueue_entity
      0.67            -0.5        0.17 =B1  4%  perf-profile.children.cycle=
s.__virt_addr_valid
      0.83            -0.5        0.35 =B1  3%  perf-profile.children.cycle=
s.__inet_lookup_established
      0.95 =B1  3%      -0.5        0.47 =B1  3%  perf-profile.children.cyc=
les.ip_rcv_finish_core
      0.85            -0.5        0.38 =B1  2%  perf-profile.children.cycle=
s.set_next_entity
      0.66            -0.5        0.20 =B1  5%  perf-profile.children.cycle=
s._copy_from_user
      0.68            -0.4        0.24 =B1  4%  perf-profile.children.cycle=
s.page_cache_pipe_buf_release
      1.08            -0.4        0.66 =B1  2%  perf-profile.children.cycle=
s.__switch_to
      0.99 =B1  4%      -0.4        0.59 =B1  4%  perf-profile.children.cyc=
les.prepare_task_switch
      0.52            -0.4        0.13 =B1  6%  perf-profile.children.cycle=
s.rseq_get_rseq_cs
      0.50 =B1  8%      -0.4        0.12 =B1  6%  perf-profile.children.cyc=
les.update_min_vruntime
      0.56            -0.4        0.19 =B1  4%  perf-profile.children.cycle=
s.tcp_event_new_data_sent
      0.56            -0.4        0.19 =B1  4%  perf-profile.children.cycle=
s.kfree
      0.46            -0.3        0.11 =B1  4%  perf-profile.children.cycle=
s.__get_user_8
      0.52            -0.3        0.17 =B1  4%  perf-profile.children.cycle=
s.sk_reset_timer
      0.53 =B1  2%      -0.3        0.19 =B1  3%  perf-profile.children.cyc=
les.__sk_dst_check
      0.52            -0.3        0.19 =B1  3%  perf-profile.children.cycle=
s.netperf_sendfile
      0.54            -0.3        0.22 =B1  4%  perf-profile.children.cycle=
s.put_prev_entity
      0.74            -0.3        0.42        perf-profile.children.cycles.=
__tcp_send_ack
      0.44            -0.3        0.12 =B1  3%  perf-profile.children.cycle=
s.sockfd_lookup_light
      0.47            -0.3        0.16 =B1  2%  perf-profile.children.cycle=
s.__mod_timer
      0.43            -0.3        0.12 =B1  5%  perf-profile.children.cycle=
s.__wrgsbase_inactive
      0.42            -0.3        0.12 =B1  4%  perf-profile.children.cycle=
s.tcp_schedule_loss_probe
      0.42            -0.3        0.12 =B1  4%  perf-profile.children.cycle=
s.do_splice_to
      0.44            -0.3        0.15 =B1  3%  perf-profile.children.cycle=
s.recv_tcp_stream
      0.42            -0.3        0.12 =B1  6%  perf-profile.children.cycle=
s.syscall_return_via_sysret
      0.40            -0.3        0.11 =B1  3%  perf-profile.children.cycle=
s.current_time
      0.48            -0.3        0.20 =B1  2%  perf-profile.children.cycle=
s.tcp_established_options
      0.60 =B1  3%      -0.3        0.32 =B1  4%  perf-profile.children.cyc=
les.___perf_sw_event
      0.38            -0.3        0.12 =B1  4%  perf-profile.children.cycle=
s.tcp_rcv_space_adjust
      0.35 =B1  2%      -0.2        0.10 =B1  4%  perf-profile.children.cyc=
les.ip_rcv_core
      0.38 =B1  2%      -0.2        0.14 =B1  3%  perf-profile.children.cyc=
les.update_cfs_group
      0.64            -0.2        0.40 =B1  2%  perf-profile.children.cycle=
s.netif_rx
      0.46            -0.2        0.23 =B1  3%  perf-profile.children.cycle=
s.__update_load_avg_se
      0.32            -0.2        0.09 =B1  5%  perf-profile.children.cycle=
s.__ip_finish_output
      0.61            -0.2        0.39 =B1  2%  perf-profile.children.cycle=
s.netif_rx_internal
      0.67            -0.2        0.46        perf-profile.children.cycles.=
ip_local_out
      0.70 =B1  6%      -0.2        0.49 =B1  2%  perf-profile.children.cyc=
les.reweight_entity
      0.28            -0.2        0.07 =B1  5%  perf-profile.children.cycle=
s.slab_free_freelist_hook
      0.38            -0.2        0.16 =B1  4%  perf-profile.children.cycle=
s.raw_spin_rq_lock_nested
      0.60            -0.2        0.39 =B1  3%  perf-profile.children.cycle=
s.update_rq_clock
      0.29            -0.2        0.08 =B1  7%  perf-profile.children.cycle=
s.copy_user_generic_unrolled
      0.24 =B1  2%      -0.2        0.04 =B1 44%  perf-profile.children.cyc=
les.ip_skb_dst_mtu
      0.30            -0.2        0.10 =B1  5%  perf-profile.children.cycle=
s.fsnotify_perm
      0.38            -0.2        0.18 =B1  5%  perf-profile.children.cycle=
s.__ksize
      0.28            -0.2        0.09 =B1  5%  perf-profile.children.cycle=
s.memcg_slab_free_hook
      0.56            -0.2        0.37 =B1  2%  perf-profile.children.cycle=
s.enqueue_to_backlog
      0.33 =B1  2%      -0.2        0.14 =B1  2%  perf-profile.children.cyc=
les.ip_send_check
      0.32            -0.2        0.13        perf-profile.children.cycles.=
__fsnotify_parent
      0.64            -0.2        0.45        perf-profile.children.cycles.=
__ip_local_out
      0.26 =B1  3%      -0.2        0.07 =B1  5%  perf-profile.children.cyc=
les.tcp_add_backlog
      0.27            -0.2        0.09 =B1  5%  perf-profile.children.cycle=
s.iterate_groups
      0.39 =B1  2%      -0.2        0.22 =B1  2%  perf-profile.children.cyc=
les.__update_load_avg_cfs_rq
      0.34            -0.2        0.17 =B1  4%  perf-profile.children.cycle=
s.__skb_clone
      0.22 =B1  7%      -0.2        0.06 =B1  8%  perf-profile.children.cyc=
les.set_next_buddy
      0.25            -0.2        0.09 =B1  7%  perf-profile.children.cycle=
s.xas_load
      0.45 =B1  7%      -0.2        0.30 =B1  2%  perf-profile.children.cyc=
les.perf_trace_sched_wakeup_template
      0.23 =B1 20%      -0.2        0.08 =B1 12%  perf-profile.children.cyc=
les.perf_trace_sched_switch
      0.24 =B1  2%      -0.2        0.09 =B1  6%  perf-profile.children.cyc=
les.select_idle_sibling
      0.23            -0.1        0.08        perf-profile.children.cycles.=
__tcp_select_window
      0.20            -0.1        0.06        perf-profile.children.cycles.=
remove_wait_queue
      0.19            -0.1        0.05        perf-profile.children.cycles.=
rcu_all_qs
      0.21            -0.1        0.07 =B1  5%  perf-profile.children.cycle=
s.sock_put
      0.16 =B1  2%      -0.1        0.02 =B1 99%  perf-profile.children.cyc=
les.syscall_enter_from_user_mode
      0.29            -0.1        0.16 =B1  3%  perf-profile.children.cycle=
s.tcp_wfree
      0.25            -0.1        0.12        perf-profile.children.cycles.=
sanity
      0.62            -0.1        0.50        perf-profile.children.cycles.=
kmalloc_reserve
      0.18 =B1  2%      -0.1        0.06 =B1  7%  perf-profile.children.cyc=
les.add_wait_queue
      0.23 =B1  2%      -0.1        0.11 =B1  3%  perf-profile.children.cyc=
les.tcp_queue_rcv
      0.17 =B1  3%      -0.1        0.06 =B1  8%  perf-profile.children.cyc=
les.inet_ehashfn
      0.25            -0.1        0.14 =B1  3%  perf-profile.children.cycle=
s.__build_skb_around
      0.16            -0.1        0.05        perf-profile.children.cycles.=
pick_next_entity
      0.16 =B1  2%      -0.1        0.05        perf-profile.children.cycle=
s.tcp_v4_fill_cb
      0.50            -0.1        0.39 =B1  3%  perf-profile.children.cycle=
s.select_task_rq_fair
      0.16 =B1  3%      -0.1        0.05        perf-profile.children.cycle=
s.rcu_read_unlock_strict
      0.20            -0.1        0.10 =B1  3%  perf-profile.children.cycle=
s.tcp_ack_update_rtt
      0.20 =B1  3%      -0.1        0.10 =B1  3%  perf-profile.children.cyc=
les.__sock_wfree
      0.15            -0.1        0.05        perf-profile.children.cycles.=
kfree_skbmem
      0.22            -0.1        0.12 =B1  4%  perf-profile.children.cycle=
s.__rdgsbase_inactive
      0.16 =B1  7%      -0.1        0.06 =B1  6%  perf-profile.children.cyc=
les.perf_tp_event
      0.56            -0.1        0.48        perf-profile.children.cycles.=
__kmalloc_node_track_caller
      0.71            -0.1        0.62 =B1  2%  perf-profile.children.cycle=
s.__cgroup_bpf_run_filter_skb
      0.13 =B1  8%      -0.1        0.05        perf-profile.children.cycle=
s.perf_trace_buf_alloc
      0.15 =B1  3%      -0.1        0.07 =B1  7%  perf-profile.children.cyc=
les.native_load_tls
      0.13            -0.1        0.05        perf-profile.children.cycles.=
psi_flags_change
      0.13 =B1  3%      -0.1        0.05 =B1  8%  perf-profile.children.cyc=
les.xas_start
      0.19 =B1  5%      -0.1        0.11 =B1  3%  perf-profile.children.cyc=
les.mark_page_accessed
      0.13 =B1  4%      -0.1        0.05 =B1  8%  perf-profile.children.cyc=
les.select_idle_cpu
      0.11            -0.1        0.03 =B1 70%  perf-profile.children.cycle=
s.woken_wake_function
      0.46            -0.1        0.38 =B1  4%  perf-profile.children.cycle=
s.sk_filter_trim_cap
      0.13            -0.1        0.06 =B1  6%  perf-profile.children.cycle=
s._raw_spin_unlock_irqrestore
      0.09 =B1  5%      -0.1        0.03 =B1 70%  perf-profile.children.cyc=
les.tcp_rearm_rto
      0.15 =B1  3%      -0.1        0.09 =B1  5%  perf-profile.children.cyc=
les.splice_from_pipe_next
      0.16 =B1  2%      -0.1        0.10 =B1  7%  perf-profile.children.cyc=
les.tcp_skb_entail
      0.12            -0.0        0.08 =B1  4%  perf-profile.children.cycle=
s.tcp_rtt_estimator
      0.22            -0.0        0.18 =B1  3%  perf-profile.children.cycle=
s.tcp_check_space
      0.08            -0.0        0.05        perf-profile.children.cycles.=
rb_insert_color
      0.12            -0.0        0.09 =B1  7%  perf-profile.children.cycle=
s.resched_curr
      0.12 =B1  4%      -0.0        0.09 =B1  6%  perf-profile.children.cyc=
les.migrate_disable
      0.10            -0.0        0.08 =B1  6%  perf-profile.children.cycle=
s.tcp_update_pacing_rate
      0.12 =B1  3%      -0.0        0.10        perf-profile.children.cycle=
s.rb_erase
      0.06 =B1  6%      -0.0        0.04 =B1 44%  perf-profile.children.cyc=
les.tcp_update_skb_after_send
      0.07 =B1  7%      -0.0        0.05        perf-profile.children.cycle=
s.ip_output
      0.09            -0.0        0.08 =B1  6%  perf-profile.children.cycle=
s.tcp_push
      0.07            +0.0        0.08        perf-profile.children.cycles.=
tcp_chrono_stop
      0.18 =B1  6%      +0.0        0.20 =B1  3%  perf-profile.children.cyc=
les.__calc_delta
      0.38            +0.0        0.40        perf-profile.children.cycles.=
__netif_receive_skb_core
      0.04 =B1 44%      +0.0        0.08 =B1  6%  perf-profile.children.cyc=
les.tcp_send_delayed_ack
      0.15 =B1  2%      +0.0        0.19 =B1  2%  perf-profile.children.cyc=
les.netif_skb_features
      0.10 =B1  6%      +0.0        0.14 =B1  9%  perf-profile.children.cyc=
les.native_queued_spin_lock_slowpath
      0.12 =B1  4%      +0.0        0.16 =B1  6%  perf-profile.children.cyc=
les.is_cpu_allowed
      0.12 =B1  3%      +0.0        0.16 =B1  3%  perf-profile.children.cyc=
les.migrate_enable
      0.07            +0.0        0.12 =B1  4%  perf-profile.children.cycle=
s.skb_network_protocol
      0.06 =B1  6%      +0.0        0.11 =B1  5%  perf-profile.children.cyc=
les.mem_cgroup_handle_over_high
      0.00            +0.1        0.05        perf-profile.children.cycles.=
__xfrm_policy_check2
      0.00            +0.1        0.05        perf-profile.children.cycles.=
perf_swevent_event
      0.05            +0.1        0.10 =B1  3%  perf-profile.children.cycle=
s.qdisc_pkt_len_init
      0.00            +0.1        0.06        perf-profile.children.cycles.=
tcp_urg
      0.05 =B1  7%      +0.1        0.11 =B1  4%  perf-profile.children.cyc=
les.security_sock_rcv_skb
      0.44            +0.1        0.50        perf-profile.children.cycles.=
ip_finish_output
      0.00            +0.1        0.07 =B1  7%  perf-profile.children.cycle=
s.sk_forced_mem_schedule
      0.05            +0.1        0.13 =B1 37%  perf-profile.children.cycle=
s.copy_page_from_iter_atomic
      0.00            +0.1        0.09 =B1  4%  perf-profile.children.cycle=
s.perf_trace_run_bpf_submit
      0.00            +0.1        0.09 =B1  6%  perf-profile.children.cycle=
s.shmem_getpage_gfp
      0.00            +0.1        0.09 =B1  6%  perf-profile.children.cycle=
s.shmem_write_begin
      0.00            +0.1        0.09 =B1 14%  perf-profile.children.cycle=
s.shmem_write_end
      0.07 =B1  6%      +0.1        0.17        perf-profile.children.cycle=
s.kmalloc_slab
      0.00            +0.1        0.10 =B1  3%  perf-profile.children.cycle=
s.switch_ldt
      0.00            +0.1        0.10 =B1  3%  perf-profile.children.cycle=
s.tcp_ack_update_window
      0.09            +0.1        0.21 =B1  3%  perf-profile.children.cycle=
s.tcp_event_data_recv
      0.00            +0.1        0.12 =B1 10%  perf-profile.children.cycle=
s.cgroup_rstat_updated
      0.00            +0.1        0.13 =B1  5%  perf-profile.children.cycle=
s.cr4_update_irqsoff
      0.05            +0.1        0.19 =B1  3%  perf-profile.children.cycle=
s.sock_recvmsg
      0.00            +0.1        0.14 =B1  5%  perf-profile.children.cycle=
s.security_socket_recvmsg
      0.00            +0.1        0.15 =B1  2%  perf-profile.children.cycle=
s.arch_local_irq_enable
      0.22 =B1  2%      +0.2        0.37 =B1  8%  perf-profile.children.cyc=
les.record__pushfn
      0.22 =B1  2%      +0.2        0.37 =B1  8%  perf-profile.children.cyc=
les.writen
      0.22            +0.2        0.37 =B1  8%  perf-profile.children.cycle=
s.write
      0.00            +0.2        0.16 =B1 15%  perf-profile.children.cycle=
s.tcp_try_rmem_schedule
      0.12            +0.2        0.28 =B1  2%  perf-profile.children.cycle=
s.sock_rfree
      0.20 =B1  2%      +0.2        0.37 =B1  9%  perf-profile.children.cyc=
les.ksys_write
      0.35            +0.2        0.53        perf-profile.children.cycles.=
finish_task_switch
      0.18 =B1  2%      +0.2        0.36 =B1  9%  perf-profile.children.cyc=
les.vfs_write
      0.17 =B1  2%      +0.2        0.36 =B1 10%  perf-profile.children.cyc=
les.new_sync_write
      0.17 =B1  2%      +0.2        0.36 =B1 10%  perf-profile.children.cyc=
les.generic_file_write_iter
      0.16 =B1  3%      +0.2        0.36 =B1 11%  perf-profile.children.cyc=
les.__generic_file_write_iter
      0.15 =B1  3%      +0.2        0.36 =B1 10%  perf-profile.children.cyc=
les.generic_perform_write
      0.46            +0.2        0.69 =B1  2%  perf-profile.children.cycle=
s.ttwu_do_wakeup
      0.44            +0.2        0.67 =B1  2%  perf-profile.children.cycle=
s.check_preempt_curr
      0.34            +0.3        0.64        perf-profile.children.cycles.=
check_preempt_wakeup
      0.31 =B1  2%      +0.4        0.68 =B1  2%  perf-profile.children.cyc=
les.validate_xmit_skb
      0.00            +0.4        0.44 =B1  6%  perf-profile.children.cycle=
s.mem_cgroup_uncharge_skmem
     15.55            +0.6       16.17        perf-profile.children.cycles.=
__tcp_push_pending_frames
      0.00            +1.1        1.08 =B1  5%  perf-profile.children.cycle=
s.__mod_memcg_state
      0.00            +1.7        1.69 =B1 30%  perf-profile.children.cycle=
s.propagate_protected_usage
      3.01            +3.5        6.48        perf-profile.children.cycles.=
__kfree_skb
     94.00            +3.7       97.66        perf-profile.children.cycles.=
main
      1.39            +4.3        5.72 =B1  2%  perf-profile.children.cycle=
s.skb_release_head_state
     92.39            +5.0       97.42        perf-profile.children.cycles.=
entry_SYSCALL_64_after_hwframe
     91.97            +5.3       97.25        perf-profile.children.cycles.=
do_syscall_64
      2.60            +5.5        8.12        perf-profile.children.cycles.=
sk_stream_alloc_skb
      3.18            +8.7       11.92 =B1  2%  perf-profile.children.cycle=
s.tcp_ack
      2.39            +8.9       11.30 =B1  2%  perf-profile.children.cycle=
s.tcp_clean_rtx_queue
      0.00           +11.2       11.17 =B1  2%  perf-profile.children.cycle=
s.__sk_mem_raise_allocated
      0.00           +11.2       11.20 =B1  2%  perf-profile.children.cycle=
s.__sk_mem_schedule
      9.27           +11.2       20.52        perf-profile.children.cycles.=
release_sock
     26.50           +11.6       38.12        perf-profile.children.cycles.=
__tcp_transmit_skb
      7.84           +12.2       19.99        perf-profile.children.cycles.=
__release_sock
     24.03           +13.1       37.09        perf-profile.children.cycles.=
__ip_queue_xmit
     19.68           +13.5       33.15        perf-profile.children.cycles.=
tcp_write_xmit
     21.67           +13.9       35.59        perf-profile.children.cycles.=
ip_finish_output2
      0.00           +14.5       14.54 =B1  3%  perf-profile.children.cycle=
s.page_counter_uncharge
      0.00           +14.6       14.56 =B1  3%  perf-profile.children.cycle=
s.drain_stock
      0.00           +14.7       14.68 =B1  3%  perf-profile.children.cycle=
s.refill_stock
     17.72           +15.2       32.88        perf-profile.children.cycles.=
__local_bh_enable_ip
      4.32           +15.4       19.69        perf-profile.children.cycles.=
tcp_build_frag
     17.20           +15.5       32.72        perf-profile.children.cycles.=
do_softirq
      0.00           +15.6       15.56 =B1  2%  perf-profile.children.cycle=
s.__sk_mem_reduce_allocated
     16.91           +15.7       32.57        perf-profile.children.cycles.=
__softirqentry_text_start
     16.58           +15.8       32.40        perf-profile.children.cycles.=
net_rx_action
     16.30           +15.8       32.13        perf-profile.children.cycles.=
__napi_poll
     16.24           +15.9       32.10        perf-profile.children.cycles.=
process_backlog
     15.43           +16.4       31.81        perf-profile.children.cycles.=
__netif_receive_skb_one_core
     13.52           +16.9       30.44        perf-profile.children.cycles.=
ip_local_deliver_finish
     13.48           +17.0       30.43        perf-profile.children.cycles.=
ip_protocol_deliver_rcu
     57.77           +17.1       74.83        perf-profile.children.cycles.=
sendfile
     13.28           +17.1       30.35        perf-profile.children.cycles.=
tcp_v4_rcv
     55.96           +18.0       73.95        perf-profile.children.cycles.=
sendfile_tcp_stream
     24.36           +21.4       45.71        perf-profile.children.cycles.=
do_tcp_sendpages
     48.80           +22.6       71.38        perf-profile.children.cycles.=
__x64_sys_sendfile64
     47.51           +23.5       71.00        perf-profile.children.cycles.=
do_sendfile
      0.00           +23.6       23.57 =B1  2%  perf-profile.children.cycle=
s.page_counter_try_charge
     45.62           +24.7       70.34        perf-profile.children.cycles.=
do_splice_direct
     45.45           +24.8       70.30        perf-profile.children.cycles.=
splice_direct_to_actor
     15.71           +25.2       40.90        perf-profile.children.cycles.=
tcp_v4_do_rcv
     15.09           +25.5       40.62        perf-profile.children.cycles.=
tcp_rcv_established
      0.00           +26.8       26.77        perf-profile.children.cycles.=
tcp_data_queue
     38.38           +29.1       67.52        perf-profile.children.cycles.=
direct_splice_actor
     38.26           +29.2       67.48        perf-profile.children.cycles.=
generic_splice_sendpage
     37.93           +29.4       67.36        perf-profile.children.cycles.=
__splice_from_pipe
     36.27           +30.5       66.75        perf-profile.children.cycles.=
pipe_to_sendpage
     35.97           +30.7       66.65        perf-profile.children.cycles.=
sock_sendpage
     35.83           +30.8       66.59        perf-profile.children.cycles.=
kernel_sendpage
     35.52           +31.0       66.50        perf-profile.children.cycles.=
inet_sendpage
     35.06           +31.3       66.36        perf-profile.children.cycles.=
tcp_sendpage
      0.00           +38.0       37.95 =B1  2%  perf-profile.children.cycle=
s.try_charge_memcg
      0.00           +39.0       38.96 =B1  2%  perf-profile.children.cycle=
s.mem_cgroup_charge_skmem
      7.98            -5.8        2.16        perf-profile.self.cycles.copy=
_user_enhanced_fast_string
      2.18 =B1  2%      -1.8        0.42 =B1  3%  perf-profile.self.cycles.=
ipv4_mtu
      2.26            -1.6        0.69 =B1  4%  perf-profile.self.cycles.lo=
ad_new_mm_cr3
      2.16            -1.3        0.89 =B1  3%  perf-profile.self.cycles._r=
aw_spin_lock_bh
      1.41 =B1  2%      -1.2        0.20 =B1  4%  perf-profile.self.cycles.=
dst_release
      1.70            -1.0        0.66 =B1  4%  perf-profile.self.cycles.ps=
i_group_change
      1.33            -1.0        0.33 =B1  3%  perf-profile.self.cycles.re=
store_fpregs_from_fpstate
      1.43            -0.9        0.52 =B1  3%  perf-profile.self.cycles.co=
py_page_to_iter
      1.30            -0.8        0.50 =B1  4%  perf-profile.self.cycles._r=
aw_spin_lock
      1.52            -0.8        0.75 =B1  2%  perf-profile.self.cycles.tc=
p_build_frag
      1.04            -0.7        0.29 =B1  4%  perf-profile.self.cycles.__=
entry_text_start
      1.04            -0.7        0.31 =B1  5%  perf-profile.self.cycles.__=
switch_to_asm
      1.24            -0.7        0.51 =B1  3%  perf-profile.self.cycles.__=
tcp_transmit_skb
      0.98 =B1  2%      -0.7        0.26 =B1  3%  perf-profile.self.cycles.=
ipv4_dst_check
      1.30            -0.7        0.58 =B1  2%  perf-profile.self.cycles.fi=
lemap_read
      0.98            -0.7        0.29 =B1  4%  perf-profile.self.cycles.sa=
ve_fpregs_to_fpstate
      1.39            -0.6        0.75        perf-profile.self.cycles.__de=
v_queue_xmit
      0.90            -0.6        0.26 =B1  4%  perf-profile.self.cycles.__=
fget_light
      0.85            -0.6        0.22 =B1  5%  perf-profile.self.cycles.re=
ad_tsc
      0.79 =B1 10%      -0.6        0.19 =B1  5%  perf-profile.self.cycles.=
_copy_to_iter
      0.88            -0.6        0.29 =B1  3%  perf-profile.self.cycles._r=
aw_spin_lock_irqsave
      1.13            -0.6        0.55 =B1  2%  perf-profile.self.cycles.fi=
lemap_get_read_batch
      0.84 =B1  2%      -0.6        0.29 =B1  3%  perf-profile.self.cycles.=
do_sendfile
      0.80            -0.5        0.26 =B1  2%  perf-profile.self.cycles.na=
tive_sched_clock
      0.72            -0.5        0.19 =B1  4%  perf-profile.self.cycles.__=
put_user_nocheck_8
      0.66            -0.5        0.17 =B1  4%  perf-profile.self.cycles.__=
virt_addr_valid
      0.95 =B1  3%      -0.5        0.47 =B1  3%  perf-profile.self.cycles.=
ip_rcv_finish_core
      0.67            -0.5        0.19 =B1  5%  perf-profile.self.cycles.__=
skb_datagram_iter
      0.68            -0.5        0.22 =B1  2%  perf-profile.self.cycles.up=
date_load_avg
      0.69 =B1  8%      -0.5        0.24 =B1  3%  perf-profile.self.cycles.=
tcp_recvmsg_locked
      0.71 =B1  2%      -0.4        0.27 =B1  4%  perf-profile.self.cycles.=
ip_finish_output2
      0.68            -0.4        0.24 =B1  4%  perf-profile.self.cycles.pa=
ge_cache_pipe_buf_release
      0.98            -0.4        0.56 =B1  2%  perf-profile.self.cycles.sk=
b_release_data
      1.08            -0.4        0.66 =B1  2%  perf-profile.self.cycles.__=
switch_to
      0.64            -0.4        0.24 =B1  4%  perf-profile.self.cycles.__=
splice_from_pipe
      0.66            -0.4        0.26 =B1  3%  perf-profile.self.cycles.do=
_tcp_sendpages
      0.67 =B1  2%      -0.4        0.28        perf-profile.self.cycles.up=
date_curr
      1.00 =B1  2%      -0.4        0.62 =B1  3%  perf-profile.self.cycles.=
__schedule
      0.50 =B1  8%      -0.4        0.12 =B1  6%  perf-profile.self.cycles.=
update_min_vruntime
      0.66            -0.4        0.29 =B1  3%  perf-profile.self.cycles.__=
inet_lookup_established
      0.52            -0.4        0.15 =B1  4%  perf-profile.self.cycles.km=
em_cache_free
      0.52            -0.4        0.16 =B1  4%  perf-profile.self.cycles.__=
local_bh_enable_ip
      0.54            -0.4        0.18 =B1  3%  perf-profile.self.cycles.kt=
ime_get
      0.46            -0.3        0.11 =B1  4%  perf-profile.self.cycles.__=
get_user_8
      0.56            -0.3        0.22 =B1  4%  perf-profile.self.cycles.ex=
it_to_user_mode_loop
      0.45            -0.3        0.11 =B1  6%  perf-profile.self.cycles.__=
rseq_handle_notify_resume
      0.48            -0.3        0.14 =B1  5%  perf-profile.self.cycles.se=
ndfile_tcp_stream
      0.52            -0.3        0.19 =B1  3%  perf-profile.self.cycles.ne=
tperf_sendfile
      0.46            -0.3        0.14 =B1  4%  perf-profile.self.cycles.at=
ime_needs_update
      0.62            -0.3        0.31 =B1  3%  perf-profile.self.cycles.tc=
p_write_xmit
      0.43            -0.3        0.12 =B1  5%  perf-profile.self.cycles.__=
wrgsbase_inactive
      0.51            -0.3        0.20        perf-profile.self.cycles.send=
file
      0.44            -0.3        0.14 =B1  9%  perf-profile.self.cycles.__=
check_object_size
      0.44            -0.3        0.15 =B1  3%  perf-profile.self.cycles.re=
cv_tcp_stream
      0.42            -0.3        0.12 =B1  6%  perf-profile.self.cycles.sy=
scall_return_via_sysret
      0.48            -0.3        0.20 =B1  2%  perf-profile.self.cycles.tc=
p_established_options
      0.53 =B1  3%      -0.3        0.26 =B1  5%  perf-profile.self.cycles.=
___perf_sw_event
      0.32 =B1  4%      -0.3        0.05        perf-profile.self.cycles.sk=
_stream_alloc_skb
      0.38 =B1 13%      -0.3        0.13 =B1  3%  perf-profile.self.cycles.=
sk_wait_data
      0.36 =B1 11%      -0.3        0.11 =B1  4%  perf-profile.self.cycles.=
inet_sendpage
      0.42            -0.3        0.17 =B1  5%  perf-profile.self.cycles.en=
try_SYSCALL_64_after_hwframe
      0.45            -0.3        0.20 =B1  2%  perf-profile.self.cycles.wa=
it_woken
      0.35 =B1  2%      -0.2        0.10 =B1  4%  perf-profile.self.cycles.=
ip_rcv_core
      0.36            -0.2        0.12 =B1  4%  perf-profile.self.cycles.sc=
hedule
      0.38 =B1  2%      -0.2        0.14 =B1  3%  perf-profile.self.cycles.=
update_cfs_group
      0.32            -0.2        0.08 =B1  5%  perf-profile.self.cycles.do=
_syscall_64
      0.41 =B1  5%      -0.2        0.18 =B1  4%  perf-profile.self.cycles.=
enqueue_entity
      0.46            -0.2        0.23 =B1  3%  perf-profile.self.cycles.__=
update_load_avg_se
      0.48            -0.2        0.26        perf-profile.self.cycles.__co=
nd_resched
      0.31            -0.2        0.09 =B1  5%  perf-profile.self.cycles.ke=
rnel_sendpage
      0.28            -0.2        0.07 =B1  5%  perf-profile.self.cycles.sl=
ab_free_freelist_hook
      0.29            -0.2        0.08 =B1  4%  perf-profile.self.cycles.re=
cv
      0.29            -0.2        0.08 =B1  7%  perf-profile.self.cycles.co=
py_user_generic_unrolled
      0.30            -0.2        0.10 =B1  5%  perf-profile.self.cycles.pr=
ocess_backlog
      0.24 =B1  2%      -0.2        0.04 =B1 44%  perf-profile.self.cycles.=
ip_skb_dst_mtu
      0.38            -0.2        0.18 =B1  5%  perf-profile.self.cycles.__=
ksize
      0.30            -0.2        0.10 =B1  5%  perf-profile.self.cycles.fs=
notify_perm
      0.30            -0.2        0.10 =B1  4%  perf-profile.self.cycles.ge=
neric_splice_sendpage
      0.28            -0.2        0.09 =B1  5%  perf-profile.self.cycles.me=
mcg_slab_free_hook
      0.34 =B1  4%      -0.2        0.15 =B1  3%  perf-profile.self.cycles.=
__alloc_skb
      0.31            -0.2        0.12 =B1  4%  perf-profile.self.cycles.kf=
ree
      0.29            -0.2        0.10 =B1  3%  perf-profile.self.cycles.sp=
lice_direct_to_actor
      0.32            -0.2        0.13        perf-profile.self.cycles.__fs=
notify_parent
      0.33 =B1  2%      -0.2        0.14 =B1  2%  perf-profile.self.cycles.=
ip_send_check
      0.29            -0.2        0.10 =B1  4%  perf-profile.self.cycles.pi=
pe_to_sendpage
      0.45            -0.2        0.27        perf-profile.self.cycles.__km=
alloc_node_track_caller
      0.27            -0.2        0.09 =B1  5%  perf-profile.self.cycles.it=
erate_groups
      0.47            -0.2        0.29        perf-profile.self.cycles.tcp_=
current_mss
      0.40            -0.2        0.22 =B1  2%  perf-profile.self.cycles.tc=
p_v4_rcv
      0.25            -0.2        0.07 =B1  5%  perf-profile.self.cycles.cu=
rrent_time
      0.39 =B1  2%      -0.2        0.22 =B1  2%  perf-profile.self.cycles.=
__update_load_avg_cfs_rq
      0.32            -0.2        0.14 =B1  3%  perf-profile.self.cycles.__=
softirqentry_text_start
      0.22 =B1  7%      -0.2        0.06 =B1  8%  perf-profile.self.cycles.=
set_next_buddy
      0.22 =B1  2%      -0.2        0.05 =B1  7%  perf-profile.self.cycles.=
tcp_sendpage
      0.27            -0.2        0.11 =B1  4%  perf-profile.self.cycles.tc=
p_send_mss
      0.22 =B1  2%      -0.2        0.07 =B1  5%  perf-profile.self.cycles.=
__mod_timer
      0.28            -0.2        0.13 =B1  4%  perf-profile.self.cycles.ge=
neric_file_splice_read
      0.22 =B1  5%      -0.2        0.06 =B1  7%  perf-profile.self.cycles.=
psi_task_change
      0.22            -0.2        0.07 =B1  7%  perf-profile.self.cycles._c=
opy_from_user
      0.23 =B1 20%      -0.2        0.08 =B1 12%  perf-profile.self.cycles.=
perf_trace_sched_switch
      0.23 =B1  2%      -0.1        0.08 =B1  4%  perf-profile.self.cycles.=
__tcp_select_window
      0.37 =B1  2%      -0.1        0.22 =B1  3%  perf-profile.self.cycles.=
tcp_clean_rtx_queue
      0.21            -0.1        0.06 =B1  7%  perf-profile.self.cycles.to=
uch_atime
      0.20            -0.1        0.06 =B1  8%  perf-profile.self.cycles.tc=
p_event_new_data_sent
      0.31 =B1  3%      -0.1        0.17 =B1  2%  perf-profile.self.cycles.=
psi_task_switch
      0.19            -0.1        0.05        perf-profile.self.cycles.rcu_=
all_qs
      0.21            -0.1        0.07 =B1  5%  perf-profile.self.cycles.so=
ck_put
      0.24 =B1  2%      -0.1        0.10 =B1  4%  perf-profile.self.cycles.=
schedule_timeout
      0.30 =B1  2%      -0.1        0.16 =B1  3%  perf-profile.self.cycles.=
do_softirq
      0.29            -0.1        0.16 =B1  3%  perf-profile.self.cycles.tc=
p_wfree
      0.25            -0.1        0.12        perf-profile.self.cycles.sani=
ty
      0.41            -0.1        0.28 =B1  3%  perf-profile.self.cycles.tc=
p_ack
      0.20            -0.1        0.07 =B1  6%  perf-profile.self.cycles.__=
x64_sys_sendfile64
      0.39 =B1  8%      -0.1        0.27 =B1  4%  perf-profile.self.cycles.=
prepare_task_switch
      0.37 =B1  3%      -0.1        0.25 =B1  4%  perf-profile.self.cycles.=
enqueue_task_fair
      0.33            -0.1        0.22 =B1  2%  perf-profile.self.cycles.tc=
p_rcv_established
      0.23 =B1  2%      -0.1        0.11 =B1  3%  perf-profile.self.cycles.=
tcp_queue_rcv
      0.17 =B1  2%      -0.1        0.06 =B1  8%  perf-profile.self.cycles.=
inet_ehashfn
      0.28            -0.1        0.17 =B1  2%  perf-profile.self.cycles.sw=
itch_fpu_return
      0.16            -0.1        0.05        perf-profile.self.cycles.pick=
_next_entity
      0.16 =B1  7%      -0.1        0.06 =B1 13%  perf-profile.self.cycles.=
ip_protocol_deliver_rcu
      0.16 =B1  2%      -0.1        0.05        perf-profile.self.cycles.tc=
p_v4_fill_cb
      0.19            -0.1        0.08 =B1  4%  perf-profile.self.cycles.fi=
lemap_get_pages
      0.16 =B1  3%      -0.1        0.05        perf-profile.self.cycles.rc=
u_read_unlock_strict
      0.29            -0.1        0.18 =B1  2%  perf-profile.self.cycles.__=
ip_queue_xmit
      0.20 =B1  3%      -0.1        0.10 =B1  3%  perf-profile.self.cycles.=
__sock_wfree
      0.15            -0.1        0.05        perf-profile.self.cycles.kfre=
e_skbmem
      0.23            -0.1        0.13 =B1  4%  perf-profile.self.cycles.__=
skb_clone
      0.18            -0.1        0.08 =B1  5%  perf-profile.self.cycles.ma=
rk_page_accessed
      0.22            -0.1        0.12 =B1  4%  perf-profile.self.cycles.__=
rdgsbase_inactive
      0.19            -0.1        0.10 =B1  3%  perf-profile.self.cycles.pu=
t_prev_entity
      0.37            -0.1        0.28 =B1  2%  perf-profile.self.cycles.km=
em_cache_alloc_node
      0.45            -0.1        0.36        perf-profile.self.cycles.__cg=
roup_bpf_run_filter_skb
      0.80            -0.1        0.71        perf-profile.self.cycles.swit=
ch_mm_irqs_off
      0.18            -0.1        0.10 =B1  4%  perf-profile.self.cycles.re=
lease_sock
      0.14 =B1 31%      -0.1        0.06 =B1  6%  perf-profile.self.cycles.=
sock_sendpage
      0.15 =B1  3%      -0.1        0.07 =B1  7%  perf-profile.self.cycles.=
native_load_tls
      0.13            -0.1        0.05        perf-profile.self.cycles.psi_=
flags_change
      0.13 =B1  3%      -0.1        0.05 =B1  8%  perf-profile.self.cycles.=
xas_start
      0.13 =B1  2%      -0.1        0.05 =B1  7%  perf-profile.self.cycles.=
sock_def_readable
      0.11            -0.1        0.03 =B1 70%  perf-profile.self.cycles.wo=
ken_wake_function
      0.16 =B1  7%      -0.1        0.09 =B1  7%  perf-profile.self.cycles.=
dequeue_entity
      0.12 =B1  3%      -0.1        0.05 =B1  8%  perf-profile.self.cycles.=
tcp_mstamp_refresh
      0.14            -0.1        0.08 =B1  7%  perf-profile.self.cycles.tc=
p_skb_entail
      0.15 =B1  3%      -0.1        0.09 =B1  5%  perf-profile.self.cycles.=
splice_from_pipe_next
      0.11            -0.1        0.06 =B1  9%  perf-profile.self.cycles._r=
aw_spin_unlock_irqrestore
      0.24 =B1  3%      -0.1        0.19        perf-profile.self.cycles.tr=
y_to_wake_up
      0.17 =B1  2%      -0.0        0.12 =B1  3%  perf-profile.self.cycles.=
set_next_entity
      0.21 =B1  2%      -0.0        0.17 =B1  4%  perf-profile.self.cycles.=
exit_to_user_mode_prepare
      0.08 =B1  6%      -0.0        0.03 =B1 70%  perf-profile.self.cycles.=
__ip_finish_output
      0.07 =B1  7%      -0.0        0.02 =B1 99%  perf-profile.self.cycles.=
__tcp_push_pending_frames
      0.33 =B1  2%      -0.0        0.29        perf-profile.self.cycles.pi=
ck_next_task_fair
      0.22            -0.0        0.18 =B1  3%  perf-profile.self.cycles.tc=
p_check_space
      0.14 =B1  2%      -0.0        0.10 =B1  3%  perf-profile.self.cycles.=
xmit_one
      0.11            -0.0        0.08 =B1  6%  perf-profile.self.cycles.tc=
p_rtt_estimator
      0.08            -0.0        0.05        perf-profile.self.cycles.rb_i=
nsert_color
      0.12            -0.0        0.09 =B1  7%  perf-profile.self.cycles.re=
sched_curr
      0.23            -0.0        0.20 =B1  2%  perf-profile.self.cycles.__=
sys_recvfrom
      0.12 =B1  4%      -0.0        0.09 =B1  6%  perf-profile.self.cycles.=
migrate_disable
      0.10            -0.0        0.08 =B1  6%  perf-profile.self.cycles.tc=
p_update_pacing_rate
      0.12 =B1  3%      -0.0        0.10        perf-profile.self.cycles.rb=
_erase
      0.19 =B1  2%      -0.0        0.17 =B1  4%  perf-profile.self.cycles.=
reweight_entity
      0.06 =B1  6%      -0.0        0.04 =B1 44%  perf-profile.self.cycles.=
tcp_update_skb_after_send
      0.07 =B1  7%      -0.0        0.05        perf-profile.self.cycles.ip=
_output
      0.09            -0.0        0.08 =B1  6%  perf-profile.self.cycles.tc=
p_push
      0.12 =B1  3%      -0.0        0.10 =B1  4%  perf-profile.self.cycles.=
__build_skb_around
      0.10 =B1  3%      -0.0        0.09 =B1  5%  perf-profile.self.cycles.=
pick_next_task
      0.08            -0.0        0.07        perf-profile.self.cycles.neti=
f_skb_features
      0.07            +0.0        0.08        perf-profile.self.cycles.tcp_=
chrono_stop
      0.25            +0.0        0.26        perf-profile.self.cycles.net_=
rx_action
      0.18 =B1  6%      +0.0        0.20 =B1  3%  perf-profile.self.cycles.=
__calc_delta
      0.38            +0.0        0.40        perf-profile.self.cycles.__ne=
tif_receive_skb_core
      0.07            +0.0        0.10 =B1  4%  perf-profile.self.cycles.__=
wake_up_common
      0.07 =B1  7%      +0.0        0.10 =B1  3%  perf-profile.self.cycles.=
tcp_recvmsg
      0.07 =B1  5%      +0.0        0.11 =B1  3%  perf-profile.self.cycles.=
__netif_receive_skb_one_core
      0.10 =B1  6%      +0.0        0.14 =B1  9%  perf-profile.self.cycles.=
native_queued_spin_lock_slowpath
      0.12 =B1  3%      +0.0        0.16 =B1  2%  perf-profile.self.cycles.=
migrate_enable
      0.07            +0.0        0.11 =B1  4%  perf-profile.self.cycles.sk=
_filter_trim_cap
      0.12 =B1  4%      +0.0        0.16 =B1  6%  perf-profile.self.cycles.=
is_cpu_allowed
      0.07            +0.0        0.12 =B1  4%  perf-profile.self.cycles.sk=
b_network_protocol
      0.06            +0.0        0.11 =B1  6%  perf-profile.self.cycles.me=
m_cgroup_handle_over_high
      0.00            +0.1        0.05        perf-profile.self.cycles.__tc=
p_send_ack
      0.00            +0.1        0.05        perf-profile.self.cycles.__xf=
rm_policy_check2
      0.00            +0.1        0.05        perf-profile.self.cycles.perf=
_swevent_event
      0.00            +0.1        0.05        perf-profile.self.cycles.sock=
_recvmsg
      0.00            +0.1        0.05        perf-profile.self.cycles.ttwu=
_do_activate
      0.05            +0.1        0.10 =B1  3%  perf-profile.self.cycles.qd=
isc_pkt_len_init
      0.24 =B1  3%      +0.1        0.29 =B1  4%  perf-profile.self.cycles.=
select_task_rq_fair
      0.00            +0.1        0.06 =B1  6%  perf-profile.self.cycles.sh=
mem_write_end
      0.00            +0.1        0.06        perf-profile.self.cycles.tcp_=
urg
      0.05 =B1  7%      +0.1        0.11 =B1  4%  perf-profile.self.cycles.=
security_sock_rcv_skb
      0.00            +0.1        0.06 =B1  7%  perf-profile.self.cycles.tc=
p_send_delayed_ack
      0.00            +0.1        0.07 =B1  7%  perf-profile.self.cycles.sk=
_forced_mem_schedule
      0.00            +0.1        0.09 =B1  4%  perf-profile.self.cycles.pe=
rf_trace_run_bpf_submit
      0.07 =B1  6%      +0.1        0.17        perf-profile.self.cycles.km=
alloc_slab
      0.00            +0.1        0.10 =B1  3%  perf-profile.self.cycles.sw=
itch_ldt
      0.00            +0.1        0.10 =B1  3%  perf-profile.self.cycles.tc=
p_ack_update_window
      0.00            +0.1        0.11 =B1  5%  perf-profile.self.cycles.ar=
ch_local_irq_enable
      0.00            +0.1        0.11 =B1  3%  perf-profile.self.cycles.tc=
p_data_queue
      0.00            +0.1        0.12 =B1  4%  perf-profile.self.cycles.re=
fill_stock
      0.09            +0.1        0.21 =B1  3%  perf-profile.self.cycles.tc=
p_event_data_recv
      0.00            +0.1        0.12 =B1 10%  perf-profile.self.cycles.cg=
roup_rstat_updated
      0.00            +0.1        0.13 =B1  5%  perf-profile.self.cycles.cr=
4_update_irqsoff
      0.00            +0.1        0.14 =B1  5%  perf-profile.self.cycles.se=
curity_socket_recvmsg
      0.08            +0.1        0.22 =B1  4%  perf-profile.self.cycles.in=
et_recvmsg
      0.11            +0.1        0.26        perf-profile.self.cycles.ip_r=
cv
      0.16            +0.2        0.32        perf-profile.self.cycles.dequ=
eue_task_fair
      0.12            +0.2        0.28 =B1  3%  perf-profile.self.cycles.so=
ck_rfree
      0.00            +0.2        0.19 =B1  4%  perf-profile.self.cycles.__=
sk_mem_raise_allocated
      0.29            +0.2        0.50 =B1  2%  perf-profile.self.cycles.fi=
nish_task_switch
      0.00            +0.3        0.29 =B1  3%  perf-profile.self.cycles.me=
m_cgroup_charge_skmem
      0.14 =B1  3%      +0.3        0.47 =B1  2%  perf-profile.self.cycles.=
validate_xmit_skb
      0.10            +0.4        0.51 =B1  2%  perf-profile.self.cycles.ch=
eck_preempt_wakeup
      0.00            +0.4        0.41        perf-profile.self.cycles.__sk=
_mem_reduce_allocated
      0.00            +1.0        0.97 =B1  6%  perf-profile.self.cycles.__=
mod_memcg_state
      0.00            +1.7        1.68 =B1 30%  perf-profile.self.cycles.pr=
opagate_protected_usage
      0.00           +13.5       13.54        perf-profile.self.cycles.page=
_counter_uncharge
      0.00           +14.3       14.28        perf-profile.self.cycles.try_=
charge_memcg
      0.00           +22.8       22.81 =B1  2%  perf-profile.self.cycles.pa=
ge_counter_try_charge




Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

