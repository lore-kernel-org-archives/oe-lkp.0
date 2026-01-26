Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC82D8399
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jan 2026 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769413065; cv=fail; b=LgcDkNPxLrKA/HIeRutr8YajGI0+tpm6NpSUtZKrVxNrGnvFSpHaLSQOGffJZ68hqHJbodwBdGY0lauEx7HQMbNd2inzSWzlve5LkbP6M+Bw4RsQIiMqO1LW2FF/OhVJITCOnUmorGrjPzlRU+p8om/dInTzhmLdujSo3OxDNRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769413065; c=relaxed/simple;
	bh=JN7zgWujrx79kCd93GqzuidyWuoDQJgsZJ5KLUB376A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=clewHJSDGjfR7zVIvR0isUQu3nEmIdpqORna4+TxMjHxZRp+eybp4JwKo3pcOOY/cVeDH23/xrmb2KFvilNBWhTq5lQ/qVvpg1+OaCxpugTK4jhXf0aSDQWFwB02oFagHggzrxAayMeKzFzNrooGWrkzMB9ZqCpiarynByaFbsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1oEYy4W; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1oEYy4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769413049; x=1800949049;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=JN7zgWujrx79kCd93GqzuidyWuoDQJgsZJ5KLUB376A=;
  b=P1oEYy4WnRQGnap8fVoeo10zZ/icC35KtQalRMDQGTBMgAaThuCtqt+j
   oZ49xkvZKZxwTJACaRTNz+ru44XJmLNtMggidlBUdr5fSvy4+/wZ4pezj
   hRxPtI7TWtWHVlH5I76GRBgYQttg0UtRGxnQ3UwKINhI4oDV5t3DzBG3F
   YT1xYR6KZTu00R5vDBBn+JPcYhSLbFhGF7p0Qjzy6iI3G/TOCKI1oJMD1
   OJbWdH+32gxMCWSY2lABbDTjS+eAMFtdwnG8klVZm/4uK8+eQE77fey2H
   j9eL1vgFwrh/O9eJY1rmOY/S1VqEKWoeSxuxxJW8jFM5eJBGlZoAISnfT
   A==;
X-CSE-ConnectionGUID: AoK8LHqeRMWznBF3Xrd1Hw==
X-CSE-MsgGUID: e0e4G3tiRhOxYkSZs+jVug==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="74453705"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="74453705"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 23:37:25 -0800
X-CSE-ConnectionGUID: 04vmpk9WSOaYhM+TZ1tj3Q==
X-CSE-MsgGUID: B30EE6RSSNergB6CKVUe8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="208042451"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 23:37:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 25 Jan 2026 23:37:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 25 Jan 2026 23:37:24 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 25 Jan 2026 23:37:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3kAPl+dTZOWt/RvfwGCuwC6V77fOlv6cA1LDLOMVZmIVzyvJHTU4Dpnb1xx/sziUoFvln8hrZrOmYXBnoB7c3j0gOSW2Wkqsr6zCxS+1ROBZDn0Hqnev9dFBKIuWvUnvQYIQqZ+Y3TNdFmCbO6TQOsSTHG3tgpuaRexYn8cuF+VY7129h6NzV45LkVi3OjgN2BA/oam4eIb0MEfrj16kdxdLHsCIxNoTADlLPYuix24ci7EZr5HnNaTsr3cDQJsGmsxPP/QuUrG2vGa3wgbTaY/A2ugXZmv2Qu5s05W9abA3skC42nl866gKxqCvDZN0LVloZJG1qlTyMeIQmKwBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8bk2ZXhw4xI1jILkgjae0GcbfexWE2PQ09ePOZixkU=;
 b=qCAQILIRNeJh/zfnFMPw2xfJJtxElS/iw1xQYw4CGANu3uujXkSo1RIirEPk7XshvSqvjL7dXV2keIDif3plGIo1BKH1r00kB+VWeR+TS6yyJ9yRROt0TMzfiRHx2R37LZM2xWE98gEtxoktaoT2ag/2piYrsgWW+WYp+urbSpVOmzm8mp62VsKUOrUKC7LhscqpOFARPLUQGReH3OmKF1+c25NyYr8GiiUSzeSrILTH10/ehGtBYjD7j7ybXH6ANBUO0fRmGURQJse5aWfmi1t/vk7wu9MMr6pv/7AQuNzGT7EJJ6sQdbnbIzRhSefzN8HDFyIoKXOQgUfPvhYeXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB5203.namprd11.prod.outlook.com (2603:10b6:303:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 26 Jan
 2026 07:37:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 07:37:21 +0000
Date: Mon, 26 Jan 2026 15:37:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Marco Elver <elver@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:locking/core] [cleanup]  3931d4b980: ktools.maple.make.fail
Message-ID: <202601261546.d7ae2447-lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: KU2P306CA0005.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5a9602-6bc5-489b-cb4e-08de5cadbd86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXhPSTcvNE4rb0wyQkxabHczWm5kdnowa0swOEtDVHNYZ3dWY1Z4YXJxdWgw?=
 =?utf-8?B?bXBmOHdmTC9SSGdMdW14UE0zakVzdy83QlZESWIxMzVEMVdiMlhxUythQjhZ?=
 =?utf-8?B?V1Z0Sk8wd3dIV1RySXdLSUZ4NlI0Sk51TU15eWhLek5RMC9TZDRRYndlUWZ2?=
 =?utf-8?B?RW5LZTlhNEE3bmQxZUxkQ1VveTdZRGZEeFdFK3JiTzJ6cjRNcnRQaFRjZDli?=
 =?utf-8?B?WGRMbm9IODdMeGplTFpkV2ZJOGtLMHVWSXhFNk1Zc01hZnR4eVc5aENVRm9U?=
 =?utf-8?B?dGx0c1h4bkVIRnIxYlFPYjNZcHRwVzZGbER3RXhLNXJPQU1WSnZQYjYzSVB2?=
 =?utf-8?B?UVk5cEIvdHJQbkxscGpuc05HcFZ0MWp5eEpYWGVJaWM1Q0dBNlZKaVZ5OEtV?=
 =?utf-8?B?VUNuWDg4MFN0akJML3czdkdPVmtocDFaMWpDYW5ScVg2OUc0Zit0Z25IWjFT?=
 =?utf-8?B?YU1vMVpSRFNJWm1vdXdwOW12YnRjODd1TXo5bjR3UjgrOUJ4Qk1QcVplNUk0?=
 =?utf-8?B?U0E3ZDhTVjVwaXR1dEo2SmxYdlRlblkxYzJYQlZRQzZib2MrTEsySldhd0Z1?=
 =?utf-8?B?VUJibkVuNWJVY3ZBZmJwbVRKNlZkSE5JakJ4Z2NpTnI5SzM2Wml0eEFTTUgy?=
 =?utf-8?B?ZEdjMnpWZm0rOHBXeEdtM21HVmwxYi8vY0lONUFKRytmdmFQcjdwaXJXUkk4?=
 =?utf-8?B?YjcrNnVGb2VoN1BNWWRDY3VpU0hPYUhmdGgzWVcrL3JzWmdCck1nTUdKdm1a?=
 =?utf-8?B?NnpMVk9xNzZtZ0pkMytxc3BsbHMwR3NSU1VTRzhqOGZGUFRuNEdzUkR5VUMz?=
 =?utf-8?B?MHdQODlqVmEwUjJOS2xtTSt4TWNWTW54WUtyVlU1T3pWVGRxMS9YUHFueFBo?=
 =?utf-8?B?bjBkS2tLRVJRbGxzWUh6QXN4UitwT0YyS1VFeDJ0SWtlNkkweXJwdVZOR3ZQ?=
 =?utf-8?B?VHFlR3I1NXh2d0piNHhiQ1ZXYzBSQStHZzBhaVl6Q2pBYnJ0cEtjR1dRSmZ0?=
 =?utf-8?B?aXF1N2d2NTIzaWF6R3Rkb2M0SXJmbzN3ZGRmV2JTSkFIU1BkQlRsaUlOaWYw?=
 =?utf-8?B?VWhNK0kwd3NaTEp6SWQ1cmY0em1HQ29MOFZ5UzBpS1hyZEtBU3J1d2x5SVNE?=
 =?utf-8?B?WWEwMHlXSnNjVzMrQ0hlYXpJRTRXUUIxYTk4OVk0cTdTVCtoVEpmL2R3bkJv?=
 =?utf-8?B?bXhBaExWbGg1bmVvNkVhN21lUWQrRHA2Y0xBUFRFWnZJdmZtWFZuNUdIVTRI?=
 =?utf-8?B?NHkwOGpYZmIvVWVHRm1kUXdZNXErVHpPajU3anM0S1Q0SU9xMEtKSVBGeW5N?=
 =?utf-8?B?T28zdFkvcS9RVEkxWUhncURmek9uNmJuMFA4QlpneG41VGhXdTgybjBsb2lw?=
 =?utf-8?B?OVFaSzNYNjhBajBsdmk5bXFLY2lqSXJXZGl5MEFrTmV2aCtaanhNRnRYOXVR?=
 =?utf-8?B?UnkxWkRLSjAxOHJ0cWl6SlU0cVdkbVJvRkZOVmhrR1p2RUpJNjBkZEw0dWk5?=
 =?utf-8?B?Tlk2NzlTNkMvZHRVenVGMFVyVytaWFJaMXdkcVBtMG1RRDJmY0R3UlZwT0pV?=
 =?utf-8?B?cXBMQWdBN0QvbmVuZU1VYVBvYUZuWCsyNmNPd0d6M3VycmwyODg5R3lYOC94?=
 =?utf-8?B?am5QL3NVck0rSjBrV3E3UGhFeHFmQ1MxRURUSExzc0hERTJscHZMdmtrSjRS?=
 =?utf-8?B?dTNrN05ObDFYOGYrWVBzZDJjWlJLbEhYRUZNNXd2S2J3VE1mWW5BcExMRVBo?=
 =?utf-8?B?ZVRYR1RJVFUrRGM3SzlWbUpjRHdmQU9TUlVJU0VCMGRDVWZ1RUhrOXcyNFRp?=
 =?utf-8?B?L1J0cVM2NG1iNWlGRGR5bWpWSytGamdxTitIVzJ0TnRodEVabDA0N1BaS3dY?=
 =?utf-8?B?dlArWDk5NGJ3NVZ2bHNXSXdLNDlBN21yMVBiejRMWTZldzBUanJSSGhFRW9S?=
 =?utf-8?B?ZnRVSmJMQ3FKSmdoaU1iSGZxRFpVTlVSYllPMzJyRXpjRjNPaGE4NlVwYjRo?=
 =?utf-8?B?YjhIVzdWMEVDM1NBaWVZMjNiVHNxaW1hbXppM3h0dGdTQll0UzJTTEtXcGc2?=
 =?utf-8?B?NDBpTnZBSStMME9xT2U3eHR3NlFyeEE2MmpsME9jb1REalpQcFQ1TlExYkFi?=
 =?utf-8?Q?hx/Zh9Z5vkNPoBQiVXfGq5+yC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXVhem1UOUxaTGxobkZyc3lDcUJOSjhKOG5LRGQxMzR1Vmh3SnY4c0plNUJQ?=
 =?utf-8?B?WC9IT1dscCtBSWVnbVQxN3FqN2ZGU2dLTm84V2xMY2s4cVkrdEdnODg0NEd4?=
 =?utf-8?B?aHdPcFBVemVNc3F2VlhkT0lsN2JzVHFic0g1TmZXcGpPdmRld0RFUmErVWlP?=
 =?utf-8?B?U2hhemVoWmpMY3pxM2xicW9sSVZRbEJOWWx2aEhGNnF1bmE1djM5dlN1UmlN?=
 =?utf-8?B?ek0zUDVHZHE4TUMzNjFxTjg0SnByeFNGVjlVczJ5d3VFUFhuc3BLQ0dlU0tU?=
 =?utf-8?B?SEJZK25SMkVTWXJPMFpyQzNJaEtMTHR2cVJxTk15YzdBSDFYYjVFSDdSSjVz?=
 =?utf-8?B?V3ZSSkN1eWZOYTlKL2JMSW95WCtnQWJoNE1yVHF6dndqN2ZpVTQvVUcza2Fo?=
 =?utf-8?B?MXRqNFdyQ0xBUU43YUYva1RwMG83L3hlT1JxOVN5ejVLTWdBTmVnNUZZdkF6?=
 =?utf-8?B?K0hKaENmYzRVaFVKby9TWmFZYjJxUUFSQURUeU5JSG1Kb25GVWt1TC9PdWNp?=
 =?utf-8?B?N0sxdjkrb2JpL3RueUJzOTd6S0ptb2lPZjIyWVNBRjdyejlweHlxZXBUaE9C?=
 =?utf-8?B?RmJIL1RJcVNNUk9jaW9wQ0JIUHovbFQvcTdRbWxkaXpWYTNMdHNRN1BnUWU4?=
 =?utf-8?B?Q3JrQXVYL2Vha1BoMHZ3NHRpdDA2S3VQc1VmVlJSd2crcEZuNzRDNHNvS1My?=
 =?utf-8?B?Z0REaUlSVklKaUZibS9JZ2xoci96TDVRS3Fra3p0MTNDZFFUZjlScUREb2Rm?=
 =?utf-8?B?RXIxcHdYNDFqUTBKc1J3cDFVZjVVMmp6Zy8rOFh6T3hMd3VjYUtIdFFMKytD?=
 =?utf-8?B?Q2JqbGhialM0ZDdRamVtUDhJQTZ4bnpJQlV4SE56MWg1QUhWZmxzM2xRTDRJ?=
 =?utf-8?B?eEVxOXVJWVJYZTRwL3doczdJdGg0dU1BWldNTDEvbkR3RkFkRjhsSVpKL01R?=
 =?utf-8?B?dUJDVGxFRFRXSmtQV3ZLK2RYaVVJbC9aYmRxNVJDV3JZK2N3cnVodlZ6YVNE?=
 =?utf-8?B?b0ZyYTJkbUUzSVloZXFIQ2NPYkdYL0VpWGsyWmxEZGVyRGMwM3UrTVoxT0ZR?=
 =?utf-8?B?RWNuSTViTUZ2ZFdPakQ0b1htQTJsaDVMWUtBL1FKeE00QllUTzhqQWFDMkkr?=
 =?utf-8?B?UUZmeUFSVENRdVdBMnVDMkJ1bTVaMEJIdy92NnVyMEFUV2NqR1JzbWw0TVY5?=
 =?utf-8?B?Y3g5V2NjdVZHQ2lOWXNTOG5HbzhXOXBMcnBBZmg3TzdiNmpQU0t0blJWbWhW?=
 =?utf-8?B?cXhycGIzM0RFWG40a3NxenRwV1VncmJUTUt6cWREY2V1M09jN1hiUTVXc2tN?=
 =?utf-8?B?V2pUVndsUTdLaW1reWFVa0pVSUEvNDdZbzRabzlPV0pBcHNaZWxnenE0T0VG?=
 =?utf-8?B?MUs2d1Fhd3dYNndHR0g0enZpK0xET2RtRkp1MFdWbkJsMUkrU1lmaHJsVjg2?=
 =?utf-8?B?ZW84ZGdxd1o5cktoRE1BWktHQjBBdC9xekJvaTdpVTN0OHZjMGJtZ2F4clZ5?=
 =?utf-8?B?Y3lsaHBTR1lEQTRaY2lBY1BjNDViMjVoQVlET2l1d20vL0RXWDd3djVuRllw?=
 =?utf-8?B?ZTZCeTF6Ny8vVU5MeVdnN3ZOYUprMElIdm8xTTBReHRyZWw4ZTJZT0RSdVJJ?=
 =?utf-8?B?RjlqYzcxWnMxUTJ1SStxNXE1aHE0VjlvM29sMEpaanpIWlVtL3V0WVNNZVBw?=
 =?utf-8?B?a2MweDNGQXk4RnVmMWxPWGk0UEsxckVDUCtIUFR0SjVmUWlVUllTQnRxbHdn?=
 =?utf-8?B?anFteXRwYTFUaFNYaTlPa29NZnJnc0pJTERZcFRaRnVTUTJxbENLdjcyNS9t?=
 =?utf-8?B?ZENNaUVMc3ZBNkx0ZVEyTDkzaCsrcEkxOXVFbStySVRtcWl4eFRTZzdGQ0lE?=
 =?utf-8?B?bzVFSkNZMXdPd3Z2cFBJY1d1OXRxSUtBYXYwQXdCNGx6N0pmOTA0S09XUW9n?=
 =?utf-8?B?YVJQa1dIamQ5ZGF0aWNpNVBNcW1LVXdxUEMvd0dhaWd6b3J3RGJMa05ybkF3?=
 =?utf-8?B?ZXZ0cWxmTHoxbnJQRlVBTHlkT0ZTT2hTV3hXczluZThnSHdVUXhXY3ZkVVE2?=
 =?utf-8?B?Ull5cjU3Z3VJVy9JYlFpSDU2UU14WmJha2VDMUNKdGpwNEQ5cjRqL29wQWtn?=
 =?utf-8?B?S21CdXNvY285ZVI2WHhpTEdjSEFZdG8wWFBJUjRyRTlvTVR6Qm45K1ZZYVBp?=
 =?utf-8?B?TVNGR1F5cjB6ZXVXVnFNd3BXaXl0WWl0VUowcjl3aEc3ZmJzdVluYlAybXpa?=
 =?utf-8?B?OWQvQWphTGRXNllYcXlySXJZLzBacUZiSHVIc1hCWThZdkRHcjdHeCtGRk5k?=
 =?utf-8?B?YVRyaVhLSGplZHM4MnFCMkM1UEhUbWNSbE53bWVCMHRmS25jNnVEQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5a9602-6bc5-489b-cb4e-08de5cadbd86
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 07:37:21.5643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fgHy0Ko+9hQ1VQdOWxLyRf7NXFFjXzjBZ+zBWJQIMyHIU9hxdo/h2RAhRvT8Md35vFKPcXTrMqF5xftywTK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5203
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "ktools.maple.make.fail" on:

commit: 3931d4b980398012b66c8ff203bfa2ab3df71a71 ("cleanup: Basic compatibility with context analysis")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core


in testcase: ktools
version: 
with following parameters:

	test: radix-tree/maple



config: x86_64-rhel-9.4-func
compiler: gcc-14
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.00GHz (Skylake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202601261546.d7ae2447-lkp@intel.com


KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rhel-9.4-func-3931d4b980398012b66c8ff203bfa2ab3df71a71

Generating generated/map-shift.h
Generating generated/bit-length.h
cp ../shared/autoconf.h generated/autoconf.h
cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined    -c -o main.o main.c
cc -c -I../shared -I. -I../../include -I../../arch/x86/include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined  ../shared/xarray-shared.c -o xarray-shared.o
sed -e 's/^static //' -e 's/__always_inline //' -e 's/inline //' < ../../../lib/radix-tree.c > radix-tree.c
cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined    -c -o radix-tree.o radix-tree.c
In file included from ../shared/linux/cleanup.h:2,
                 from ../shared/linux/../../../../include/linux/idr.h:18,
                 from ../shared/linux/idr.h:5,
                 from radix-tree.c:18:
../shared/linux/../../../../include/linux/idr.h: In function ‘class_idr_alloc_destructor’:
../shared/linux/../../../../include/linux/cleanup.h:283:9: error: expected declaration specifiers before ‘__no_context_analysis’
  283 |         __no_context_analysis                                           \
      |         ^~~~~~~~~~~~~~~~~~~~~
../shared/linux/../../../../include/linux/idr.h:136:1: note: in expansion of macro ‘DEFINE_CLASS’
  136 | DEFINE_CLASS(idr_alloc, struct __class_idr,
      | ^~~~~~~~~~~~
../shared/linux/../../../../include/linux/cleanup.h:286:9: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘__no_context_analysis’
  286 |         __no_context_analysis                                           \
      |         ^~~~~~~~~~~~~~~~~~~~~
../shared/linux/../../../../include/linux/idr.h:136:1: note: in expansion of macro ‘DEFINE_CLASS’
  136 | DEFINE_CLASS(idr_alloc, struct __class_idr,
      | ^~~~~~~~~~~~
../shared/linux/../../../../include/linux/idr.h:142:72: error: expected declaration specifiers before ‘;’ token
  142 |              struct idr *idr, void *ptr, int start, int end, gfp_t gfp);
      |                                                                        ^
../shared/linux/../../../../include/linux/idr.h:153:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  153 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:167:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  167 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:178:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  178 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:190:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  190 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:259:1: warning: empty declaration
  259 | struct ida_bitmap {
      | ^~~~~~
../shared/linux/../../../../include/linux/idr.h:263:1: warning: empty declaration
  263 | struct ida {
      | ^~~~~~
../shared/linux/../../../../include/linux/idr.h:292:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  292 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:310:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  310 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:328:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  328 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:333:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  333 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:338:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  338 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:343:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  343 | {
      | ^
../shared/linux/../../../../include/linux/idr.h:348:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  348 | {
      | ^
In file included from radix-tree.c:19:
../../include/linux/init.h:23:1: warning: empty declaration
   23 | struct obs_kernel_param {
      | ^~~~~~
In file included from radix-tree.c:21:
../shared/linux/kmemleak.h:1:59: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
    1 | static inline void kmemleak_update_trace(const void *ptr) { }
      |                                                           ^
In file included from radix-tree.c:26:
../../include/linux/slab.h:12:1: warning: empty declaration
   12 | enum _slab_flag_bits {
      | ^~~~
../../include/linux/slab.h:39:1: warning: empty declaration
   39 | enum slab_state {
      | ^~~~
../../include/linux/slab.h:46:1: warning: empty declaration
   46 | struct kmem_cache {
      | ^~~~~~
../../include/linux/slab.h:63:1: warning: empty declaration
   63 | struct kmem_cache_args {
      | ^~~~~~
../../include/linux/slab.h:126:1: warning: empty declaration
  126 | struct slab_sheaf {
      | ^~~~~~
../../include/linux/slab.h:139:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  139 | {
      | ^
../../include/linux/slab.h:143:1: warning: empty declaration
  143 | struct list_lru;
      | ^~~~~~
../../include/linux/slab.h:147:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  147 | {
      | ^
../../include/linux/slab.h:161:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  161 | {
      | ^
../../include/linux/slab.h:170:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  170 | {
      | ^
../../include/linux/slab.h:201:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  201 | {
      | ^
In file included from radix-tree.c:27:
../../include/linux/string.h:24:9: error: expected declaration specifiers before ‘#pragma’
   24 | #pragma GCC diagnostic push
      |         ^~~
../../include/linux/string.h:29:9: error: expected declaration specifiers before ‘#pragma’
   29 | #pragma GCC diagnostic pop
      |         ^~~
../../include/linux/string.h:43:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   43 | {
      | ^
../../include/linux/string.h:51:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   51 | {
      | ^
../../include/linux/string.h:61:28: error: storage class specified for parameter ‘skip_spaces’
   61 | extern char * __must_check skip_spaces(const char *);
      |                            ^~~~~~~~~~~
../../include/linux/string.h:63:14: error: storage class specified for parameter ‘strim’
   63 | extern char *strim(char *);
      |              ^~~~~
../../include/linux/string.h:65:13: error: storage class specified for parameter ‘remove_spaces’
   65 | extern void remove_spaces(char *s);
      |             ^~~~~~~~~~~~~
../../include/linux/string.h:67:14: error: storage class specified for parameter ‘memchr_inv’
   67 | extern void *memchr_inv(const void *start, int c, size_t bytes);
      |              ^~~~~~~~~~
../../include/linux/string.h:68:27: error: storage class specified for parameter ‘memparse’
   68 | extern unsigned long long memparse(const char *ptr, char **retptr);
      |                           ^~~~~~~~
In file included from radix-tree.c:30:
../../../lib/radix-tree.h:4:1: warning: empty declaration
    4 | struct kmem_cache;
      | ^~~~~~
../../../lib/radix-tree.h:5:1: warning: empty declaration
    5 | struct rcu_head;
      | ^~~~~~
../../../lib/radix-tree.h:7:27: error: storage class specified for parameter ‘radix_tree_node_cachep’
    7 | extern struct kmem_cache *radix_tree_node_cachep;
      |                           ^~~~~~~~~~~~~~~~~~~~~~
../../../lib/radix-tree.h:8:13: error: storage class specified for parameter ‘radix_tree_node_rcu_free’
    8 | extern void radix_tree_node_rcu_free(struct rcu_head *head);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
radix-tree.c:35:20: error: redefinition of parameter ‘radix_tree_node_cachep’
   35 | struct kmem_cache *radix_tree_node_cachep;
      |                    ^~~~~~~~~~~~~~~~~~~~~~
../../../lib/radix-tree.h:7:27: note: previous definition of ‘radix_tree_node_cachep’ with type ‘struct kmem_cache *’
    7 | extern struct kmem_cache *radix_tree_node_cachep;
      |                           ^~~~~~~~~~~~~~~~~~~~~~
In file included from radix-tree.c:22:
radix-tree.c:62:23: error: parameter ‘radix_tree_preloads’ is initialized
   62 | DEFINE_PER_CPU(struct radix_tree_preload, radix_tree_preloads) = {
      |                       ^~~~~~~~~~~~~~~~~~
../shared/linux/percpu.h:3:35: note: in definition of macro ‘DEFINE_PER_CPU’
    3 | #define DEFINE_PER_CPU(type, val) type val
      |                                   ^~~~
radix-tree.c:65:47: error: expected declaration specifiers before ‘;’ token
   65 | EXPORT_PER_CPU_SYMBOL_GPL(radix_tree_preloads);
      |                                               ^
radix-tree.c:68:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   68 | {
      | ^
radix-tree.c:73:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   73 | {
      | ^
radix-tree.c:81:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   81 | {
      | ^
radix-tree.c:87:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   87 | {
      | ^
radix-tree.c:96:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   96 | {
      | ^
radix-tree.c:102:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  102 | {
      | ^
radix-tree.c:108:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  108 | {
      | ^
radix-tree.c:114:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  114 | {
      | ^
radix-tree.c:119:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  119 | {
      | ^
radix-tree.c:124:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  124 | {
      | ^
radix-tree.c:129:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  129 | {
      | ^
radix-tree.c:134:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  134 | {
      | ^
radix-tree.c:139:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  139 | {
      | ^
radix-tree.c:144:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  144 | {
      | ^
radix-tree.c:154:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  154 | {
      | ^
radix-tree.c:164:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  164 | {
      | ^
radix-tree.c:182:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  182 | {
      | ^
radix-tree.c:204:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  204 | {
      | ^
radix-tree.c:212:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  212 | {
      | ^
radix-tree.c:217:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  217 | {
      | ^
radix-tree.c:224:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  224 | {
      | ^
radix-tree.c:237:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  237 | {
      | ^
radix-tree.c:291:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  291 | {
      | ^
radix-tree.c:309:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  309 | {
      | ^
radix-tree.c:323:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  323 | {
      | ^
radix-tree.c:366:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  366 | {
      | ^
radix-tree.c:371:34: error: expected declaration specifiers before ‘;’ token
  371 | EXPORT_SYMBOL(radix_tree_preload);
      |                                  ^
radix-tree.c:379:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  379 | {
      | ^
radix-tree.c:386:40: error: expected declaration specifiers before ‘;’ token
  386 | EXPORT_SYMBOL(radix_tree_maybe_preload);
      |                                        ^
radix-tree.c:390:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  390 | {
      | ^
radix-tree.c:410:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  410 | {
      | ^
radix-tree.c:469:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  469 | {
      | ^
radix-tree.c:545:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  545 | {
      | ^
radix-tree.c:601:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  601 | {
      | ^
radix-tree.c:657:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  657 | {
      | ^
radix-tree.c:683:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  683 | {
      | ^
radix-tree.c:705:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  705 | {
      | ^
radix-tree.c:731:33: error: expected declaration specifiers before ‘;’ token
  731 | EXPORT_SYMBOL(radix_tree_insert);
      |                                 ^
radix-tree.c:750:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  750 | {
      | ^
radix-tree.c:796:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  796 | {
      | ^
radix-tree.c:803:38: error: expected declaration specifiers before ‘;’ token
  803 | EXPORT_SYMBOL(radix_tree_lookup_slot);
      |                                      ^
radix-tree.c:818:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  818 | {
      | ^
radix-tree.c:821:33: error: expected declaration specifiers before ‘;’ token
  821 | EXPORT_SYMBOL(radix_tree_lookup);
      |                                 ^
radix-tree.c:825:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  825 | {
      | ^
radix-tree.c:837:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  837 | {
      | ^
radix-tree.c:853:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  853 | {
      | ^
radix-tree.c:878:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  878 | {
      | ^
radix-tree.c:916:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  916 | {
      | ^
radix-tree.c:919:39: error: expected declaration specifiers before ‘;’ token
  919 | EXPORT_SYMBOL(radix_tree_replace_slot);
      |                                       ^
radix-tree.c:934:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  934 | {
      | ^
radix-tree.c:941:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  941 | {
      | ^
radix-tree.c:969:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  969 | {
      | ^
radix-tree.c:993:34: error: expected declaration specifiers before ‘;’ token
  993 | EXPORT_SYMBOL(radix_tree_tag_set);
      |                                  ^
radix-tree.c:998:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  998 | {
      | ^
radix-tree.c:1031:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1031 | {
      | ^
radix-tree.c:1052:36: error: expected declaration specifiers before ‘;’ token
 1052 | EXPORT_SYMBOL(radix_tree_tag_clear);
      |                                    ^
radix-tree.c:1062:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1062 | {
      | ^
radix-tree.c:1083:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1083 | {
      | ^
radix-tree.c:1108:34: error: expected declaration specifiers before ‘;’ token
 1108 | EXPORT_SYMBOL(radix_tree_tag_get);
      |                                  ^
radix-tree.c:1114:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1114 | {
      | ^
radix-tree.c:1138:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1138 | {
      | ^
radix-tree.c:1144:38: error: expected declaration specifiers before ‘;’ token
 1144 | EXPORT_SYMBOL(radix_tree_iter_resume);
      |                                      ^
radix-tree.c:1156:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1156 | {
      | ^
radix-tree.c:1239:37: error: expected declaration specifiers before ‘;’ token
 1239 | EXPORT_SYMBOL(radix_tree_next_chunk);
      |                                     ^
radix-tree.c:1264:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1264 | {
      | ^
radix-tree.c:1286:38: error: expected declaration specifiers before ‘;’ token
 1286 | EXPORT_SYMBOL(radix_tree_gang_lookup);
      |                                      ^
radix-tree.c:1305:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1305 | {
      | ^
radix-tree.c:1327:42: error: expected declaration specifiers before ‘;’ token
 1327 | EXPORT_SYMBOL(radix_tree_gang_lookup_tag);
      |                                          ^
radix-tree.c:1346:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1346 | {
      | ^
radix-tree.c:1362:47: error: expected declaration specifiers before ‘;’ token
 1362 | EXPORT_SYMBOL(radix_tree_gang_lookup_tag_slot);
      |                                               ^
radix-tree.c:1366:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1366 | {
      | ^
radix-tree.c:1396:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1396 | {
      | ^
radix-tree.c:1400:38: error: expected declaration specifiers before ‘;’ token
 1400 | EXPORT_SYMBOL(radix_tree_iter_delete);
      |                                      ^
radix-tree.c:1415:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1415 | {
      | ^
radix-tree.c:1434:38: error: expected declaration specifiers before ‘;’ token
 1434 | EXPORT_SYMBOL(radix_tree_delete_item);
      |                                      ^
radix-tree.c:1446:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1446 | {
      | ^
radix-tree.c:1449:33: error: expected declaration specifiers before ‘;’ token
 1449 | EXPORT_SYMBOL(radix_tree_delete);
      |                                 ^
radix-tree.c:1457:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1457 | {
      | ^
radix-tree.c:1460:33: error: expected declaration specifiers before ‘;’ token
 1460 | EXPORT_SYMBOL(radix_tree_tagged);
      |                                 ^
radix-tree.c:1470:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1470 | {
      | ^
radix-tree.c:1474:27: error: expected declaration specifiers before ‘;’ token
 1474 | EXPORT_SYMBOL(idr_preload);
      |                           ^
radix-tree.c:1479:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1479 | {
      | ^
radix-tree.c:1560:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1560 | {
      | ^
radix-tree.c:1567:27: error: expected declaration specifiers before ‘;’ token
 1567 | EXPORT_SYMBOL(idr_destroy);
      |                           ^
radix-tree.c:1571:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1571 | {
      | ^
radix-tree.c:1579:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1579 | {
      | ^
radix-tree.c:1595:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
 1595 | {
      | ^
../shared/linux/../../../../include/linux/cleanup.h:282:29: error: old-style parameter declarations in prototyped function definition
  282 | static __always_inline void class_##_name##_destructor(_type *p)        \
      |                             ^~~~~~
../shared/linux/../../../../include/linux/idr.h:136:1: note: in expansion of macro ‘DEFINE_CLASS’
  136 | DEFINE_CLASS(idr_alloc, struct __class_idr,
      | ^~~~~~~~~~~~
radix-tree.c:1609: error: expected ‘{’ at end of input
make: *** [<builtin>: radix-tree.o] Error 1
make maple failed



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20260126/202601261546.d7ae2447-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

