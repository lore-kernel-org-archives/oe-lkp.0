Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52391168D0
	for <oe-lkp@lists.linux.dev>; Mon,  1 Jul 2024 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802203; cv=fail; b=a5jryrExMcCztSeedqjmbABWP94pA78C8ums57jUr+5zHgznh9eHc75LMAazHPDZ9mj3Hr0yOwxdCjKLIgaCQixHt1nxBioMoaSU5G9FxxiQM+UhEpAk61XNlxKE6U2l5ntljvjHXFz+vew168fV9Vq/oK4jjhtxum5qsVcF1e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802203; c=relaxed/simple;
	bh=ZBR8QqT6nlSkjRR3+woFhSUmoK6im2EPSN2Fr0kCau0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kxK9YSXy+Rozli1L3w+TjGEDII2xgjnn/cnq7oJ9IHa2CGRVFUsSk30Eq8EHZaq0Twh6K3zrUOlCbUN0QGa2sDCPxhZF8VahVj3hyak/fQaD3yujYAcCyI4TeogsNITqeyqvSiAurPoMwT8OTM7lKoSgVc+WsoQRZzmPi1lE6vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tq2fG5BW; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq2fG5BW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719802200; x=1751338200;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZBR8QqT6nlSkjRR3+woFhSUmoK6im2EPSN2Fr0kCau0=;
  b=Tq2fG5BWnurWFgFUPD0KteZGORYCS04JeVI4HSo1GHy8tsgGWTOOEhRs
   dMigd5Zteav3ZrUvMzWPxAfw39vgqp9tuy4eYETgShyErYBcfALcWRLPP
   T7j2IkZnM27Yx0yITO3UuvLmO9zgJ6rcO5nUFThXsNZOuqE+j+p9gdvzd
   N0KuEOMaXDVODMtCEQ840zevw6u92PqwxAbce1Zh1jkElwRzYJ+08zLcN
   82DaFNJ0enQxNGeFgqPkTkprFmQ9+n5WB5iZNfu9IX2Gu5wb2f8kXez/A
   Cyp0KHytqxzJSLxNPJAzv/B0PCkzdzOtHQi1s14FwgE0Dz2YglrtWdBSB
   A==;
X-CSE-ConnectionGUID: mUoeKc75TcODNYTOZHq9Zw==
X-CSE-MsgGUID: psM38r5FReuLxvnqWLqV7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="39416628"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="39416628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2024 19:49:59 -0700
X-CSE-ConnectionGUID: N6RPmOb/QOKWRWVIOdLBAg==
X-CSE-MsgGUID: DOZZe9PnQLqNezDjJEDfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; 
   d="scan'208";a="45435727"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Jun 2024 19:49:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 30 Jun 2024 19:49:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 30 Jun 2024 19:49:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 30 Jun 2024 19:49:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvBvDBd+5qiMUoZuLtq3CP95J45bcF/C57T3gFqsLPKzkLElyrX/tacbFmJQE5j4FePmp93DBzoRznih0VF3tKEvzvQ0CIKRLp3CMEsCUw0aFtGfZL9yRgoYNwUQfBj3U9SIGmb6u66QKk1Y86x6YRlb57wyhUJe3eR5v/qxWNSHB1920cxGtuap1o1AhWMBQPIlKoA53ZvfAsV6xNq458dTV41zSINYB0oNLVr2CaqY8gBaeufugFoTVbck1TCGiwXiLaVOBe5XLqGSYwSGKaL8l6YiaahyK8EKtq0kLec5f1QBuRdmeyITFMoi+tsnRWsc5W3MXhWKUASo3f1ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl+nlk8pbaDJyo/rcNwyGW3rlI7jOrzaVRGLaX2kC50=;
 b=ShbTxcPdcED3NUcnsJKzO6Nxd1DApG4NmmRqmwz50/DZa6fEMbMAnW3ti8UPRSvHyGWxdGblEuE8r/gt39VIjen7TGDQMufPrY9rm1f9wZGtd/yuaer3DmBULa/t2XeIeSDKCqUkn3DEWU5mVuFBkZlE3wrHkGZQD2gN55G+XA5ks+2AMA8a3+DEq1Eb6QNdq5aBbsxdCg9LfdNBZd6Jkiec1wybOJ1xVqFbDBb4q8gisXWIclX9Vu6vrC04yIL1TiVf7otEsYM/pnE2IVqLeBrxdPIzvB2+HBnj3MjY0iuMupRFDucBVUj40GfatA6Vc3mXpnQhU5rp5MG0vtc/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 by SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 02:49:55 +0000
Received: from LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::2911:480b:49e5:2cda]) by LV3PR11MB8507.namprd11.prod.outlook.com
 ([fe80::2911:480b:49e5:2cda%4]) with mapi id 15.20.7719.022; Mon, 1 Jul 2024
 02:49:54 +0000
From: "Zheng, Wu" <wu.zheng@intel.com>
To: "Sang, Oliver" <oliver.sang@intel.com>, "jasperwang@tencent.com"
	<jasperwang@tencent.com>, "kaixuxia@tencent.com" <kaixuxia@tencent.com>,
	"Liu, Frank" <frankjpliu@tencent.com>, "kasong@tencent.com"
	<kasong@tencent.com>, "Chen, Saga" <sagazchen@tencent.com>,
	"kernelxing@tencent.com" <kernelxing@tencent.com>, "Liu, Aure"
	<aurelianliu@tencent.com>, "deshengwu@tencent.com" <deshengwu@tencent.com>,
	"flyingpeng@tencent.com" <flyingpeng@tencent.com>, "Zeng, Jason"
	<jason.zeng@intel.com>, "Jia, Yingbao" <yingbao.jia@intel.com>, "Jia, Pei P"
	<pei.p.jia@intel.com>
CC: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>, lkp <lkp@intel.com>
Subject: RE: [opencloudos:next] [mbuf]  07131e4097:  hackbench.throughput
 -24.3% regression
Thread-Topic: [opencloudos:next] [mbuf]  07131e4097:  hackbench.throughput
 -24.3% regression
Thread-Index: AQHayRyFXxTNcuW9F0G3+YMDEMhLjrHhLttw
Date: Mon, 1 Jul 2024 02:49:54 +0000
Message-ID: <LV3PR11MB85070D34457121FB03AFD2DA9DD32@LV3PR11MB8507.namprd11.prod.outlook.com>
References: <202406281349.948dca73-oliver.sang@intel.com>
In-Reply-To: <202406281349.948dca73-oliver.sang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8507:EE_|SJ0PR11MB6719:EE_
x-ms-office365-filtering-correlation-id: b724c516-39de-43ec-7741-08dc99787cd8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ysAiw031KX/b6AuVwpzqnl8GHWnN+X87xE+FrsmZ4xFKuSVnsUeY4hSe6K?=
 =?iso-8859-1?Q?Y9k/Bs/e0/PAJXys1yR181avZlAjQiu7xqxX04qJy15bmxIeCF5UloD5wy?=
 =?iso-8859-1?Q?pT4U+bWQHMaEDAGaspquT3ATS6W3Jis9XJ9e+jZj6pVDk6Djw33MH8/TVW?=
 =?iso-8859-1?Q?adG6ncnOvDQMtNKfetTA4exKBwcq1c8c8c8sMOCOyGgCMrt5mrAc7brUYy?=
 =?iso-8859-1?Q?032dQIsqkIn3a1Cxilk/5gSgrtPm/Sgn8n/QlghZNIr9L3ZFLh/GGdUteH?=
 =?iso-8859-1?Q?lN4Var7qYd00OJDowI0tpz/0HQUTBmaSfCQeJO3MPgdYZArH3mA99Yh5nD?=
 =?iso-8859-1?Q?V4RtvTS/EN3W0mlaxqHxPc16QvCBlH918tqclBsYtE2nywW75vBa797hJV?=
 =?iso-8859-1?Q?0PXkASbzTz2KURRoGJ4yE4FJylxbpg6gdy54ys4s0R/w7rJvcZoui+PwPZ?=
 =?iso-8859-1?Q?bB5RI3UFNBjyBIuIq6CSWe7QRfIQRxaXZtJB64crPAVWxFrXQTfk9TvQz1?=
 =?iso-8859-1?Q?N+ojhCz5eQtRD/4l9b7uElZEr5KjsnRm5OtX/MWeDqjDUDb/6+wK+dpqSg?=
 =?iso-8859-1?Q?BDuQYZU/rt3duqfYQl6okduPDT10fnDimfd+JpWuKC581Pzo0oEKAlOOwN?=
 =?iso-8859-1?Q?RPUOAacWN2JGxuUWWcGZA9cRtfZsHEbmd/ktRYb4iKf5iIoDhum7gNY59i?=
 =?iso-8859-1?Q?cc32DMyuH+qPxftsqHM4eZnZzEKgZ6iF7TFuDzSSuO8e6iLUfRbawdYpH6?=
 =?iso-8859-1?Q?K+FO2BwNRo8KhE27mg6+1pO+FxNTi9VVh8vYNezUqFVkCc5W3law+vZTMp?=
 =?iso-8859-1?Q?HSEirLP2vk1QyPGrYdcRcpPFD92Usl4l+XOGhDf0JdlmQUEndDDBmJ2xI7?=
 =?iso-8859-1?Q?fboq8XLF0xyvsbspDjR3US8actgFZCmbUdUVFmBZClu25DRwy00JvmLLXW?=
 =?iso-8859-1?Q?llaj+zvbUnhtxzIm92moTu+PS6TBNaqyyKno5wA6gXgSQG8cDJ+0B5ZpNm?=
 =?iso-8859-1?Q?rnnw9rrp8UqXKWUuwaehvZl6FOs9LTaY16HufC0m2IoMDx4Bm19dm7KRyL?=
 =?iso-8859-1?Q?SxXdSc2YnJVbe6hGHqXGkj9lcUvpPODvy9sdAq9J6qRNnM04ckSSzhHXqC?=
 =?iso-8859-1?Q?sySkNbK3/Br1AfzAPtkoV4ejUw3NH2VQJdZP4WiwVbIMbZNut/c5/kg2kp?=
 =?iso-8859-1?Q?gFeFSX5U6wPNahXICmU0Y4yXdzQQ2fyJZx3tCviGP5MBI20Fb5bapCsQop?=
 =?iso-8859-1?Q?wdcTC/etTWrRKdvjAuXqJK8u3FCh3gh9gRYpyYbi2+FxDCLLWiExxsgYba?=
 =?iso-8859-1?Q?HhYCFd5Df9+nEJiok9VJDRAyNGyGwvjLmIB0EmRBHbpf/iJHXw03IN/+GX?=
 =?iso-8859-1?Q?ELaOG6jIDjQkvD+rLL9+vAoKGy87oYjkqInOVQR6hGbicOvpDZHQOm3FNN?=
 =?iso-8859-1?Q?lSPOSVuqoZ3PF1KA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8507.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?009ol8FOYYCJnq+y46WxcEi300zRYvFOaIOx+FTHFgHinQfVgfd77IrEXF?=
 =?iso-8859-1?Q?quNvcV/bPChWlgNdrWH298dozqyjvx+IahVOcP58m+PMveL9FAfflPoW6S?=
 =?iso-8859-1?Q?M8bolOBFU0opKgi3qmhGhgqv12CX1A7patmQCUEH18DLz8kIqsv7Zx15iS?=
 =?iso-8859-1?Q?2O+fuhyIy3gfBkT77VslC+/UpkR+OqZt92Jm4Q3akRPutv6ME2X1H4SEYv?=
 =?iso-8859-1?Q?wTOEkTpHrn8Pr2JFNc5DcUDvnyy8M9m01sX1kwQiAVRMh1XBf37ZqTGgvh?=
 =?iso-8859-1?Q?FLZEJo1HkfaoBGQ4g6ezjjVM/SteW1UCAavVdkH2BDbY7foZBGUy+XA2vT?=
 =?iso-8859-1?Q?MZVuDUzSncnqjBLrH3CrhXcpPJpFoM8d3/nw+l3mS3CjXJt+dRiY/QlTSU?=
 =?iso-8859-1?Q?B2Z/aldpIBd8DRXlbFwPJAenOUk2A/AEOYI8ZSrwoHT+FKw1a3DQrBv3qR?=
 =?iso-8859-1?Q?gDJIoj8bnf3mGkWhqvU3moYvpmsguExhsC6eyuLxZV0Ldpbj9NIx5OwZ+Q?=
 =?iso-8859-1?Q?WqoMXP/fNWVgflHLVyHF3PGDCqNzdu6cbzGSalsRc+7e4CjRotukuGyAJ8?=
 =?iso-8859-1?Q?JDgo5SUUv6uyw6vdE3wLLMeqwZTIH2RYRRoCUL275SdOZXBPIlbFA+uQZw?=
 =?iso-8859-1?Q?BodgdO3NWPqmS0MMe/cWkJMQw+ZLT6rdPSUIiKwmx7rf5LT4WGB6MUXp9L?=
 =?iso-8859-1?Q?g/7XzeEVPMD79IfTRhgvzQFBuKpJPZ7mXukPaGMtLdF+3X2s+e7vP7Uhrx?=
 =?iso-8859-1?Q?To4frGagzbnPWxeeRmaxklspK5ZtQExMjTdS4IGxdQzM7IswsFu5Cpr54h?=
 =?iso-8859-1?Q?WdJw31xG1KHMJggp1cGLdPgkHxGsqYprDT4WGfwHZyPdp2gG4fSPS6PP55?=
 =?iso-8859-1?Q?aHgYdodWWElxXqgh6Vto/erkM9wd4IrKijQe6fjYv/lIKFt159tpO28kpY?=
 =?iso-8859-1?Q?IOBVmxGDudRSOUBj3VNVMGWm3tdv6s+IIoZXBJ6yBtp7l+Ueb7o3THIym4?=
 =?iso-8859-1?Q?TZCxlAZ74zwycUhKfcT8C0aiTfKaF5/4R1OwMX/jfqoKogmzFQI4z9AAIF?=
 =?iso-8859-1?Q?NLtiWL252o7+wQmJbe4zXzhEgkkow42AdB9ZQZqp4asxVlh6b5qWy3yKZo?=
 =?iso-8859-1?Q?RYp3Ouxege4Ipi3UrsK2hojEQD81ZobYEXO83iS8wKm4apnAwgolYW2KDW?=
 =?iso-8859-1?Q?GhDWREkvVUgKVBNL0V82fBuXnhkcI7AFdiKX1SVoN212qdh8jP/1DFRdF6?=
 =?iso-8859-1?Q?M2D6891+3OBPGB0g9+BvXHOB5dXuMUnJ9zEHojOANWY7Q5Tqy1/iuOJOqr?=
 =?iso-8859-1?Q?+oKPR4eHARf+w+7zw8gdgS2jTLk0vaiNQqYmZFU5rSSx000yaXtD3OVAYI?=
 =?iso-8859-1?Q?kBg45IvR71SdjaD9MRiEuiuGv4S5U8y74FVcJxMtvcBWfrpdli91dSYvQ8?=
 =?iso-8859-1?Q?aVz01GhjH3FF9C2nG0VHPXe1IhNipJW67HLon5oYsQbavZNT1++dmMtQjV?=
 =?iso-8859-1?Q?b9tcGr1RfP31VKsRQeE73XSzo7FNiB++aj+MeLQiqciEkOl/ypXipoUt2r?=
 =?iso-8859-1?Q?0rgoRLhdrgBfFrT4vNR4Jg/aXgN1Ygc4BerjUghLTThPXokLm73lW9D/Ms?=
 =?iso-8859-1?Q?3SN7G2Ulv9lms=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b724c516-39de-43ec-7741-08dc99787cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 02:49:54.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +V3FL3WLHdRSrK2eEWo//52tl8owYhggw0rdRWxhrIKeYLZlz0mQnPcH1dYd0BHI7Tq1DcllpvcQvR4k7HHHNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-OriginatorOrg: intel.com

Hi Oliver,

Thanks Oliver for this catch and we have a talk about regression.

According to Oliver's comments, 07131e40971dc46a24d28e8ba9fdcf3f7266c398 is=
 for CONFIG_RQM.
"
we found the most change in this commit is wrapped by CONFIG_RQM, however, =
the config used for both parent and this commit which is uploaded to [1] do=
es not include this config:
# CONFIG_RQM is not set
"

According to ./arch/x86/configs/tencent.config,
07131e40971dc46a24d28e8ba9fdcf3f7266c398 need to set CONFIG_RQM=3Dy.

We can set CONFIG_RQM=3Dy and test it again and check whether this regressi=
on still exist or not. : - )=20

Best Regards
Zheng Wu
-----Original Message-----
From: Sang, Oliver <oliver.sang@intel.com>=20
Sent: Friday, June 28, 2024 1:32 PM
To: jasperwang@tencent.com; kaixuxia@tencent.com; Liu, Frank <frankjpliu@te=
ncent.com>; kasong@tencent.com; Chen, Saga <sagazchen@tencent.com>; kernelx=
ing@tencent.com; Liu, Aure <aurelianliu@tencent.com>; deshengwu@tencent.com=
; flyingpeng@tencent.com; Zeng, Jason <jason.zeng@intel.com>; Zheng, Wu <wu=
.zheng@intel.com>; Jia, Yingbao <yingbao.jia@intel.com>; Jia, Pei P <pei.p.=
jia@intel.com>
Cc: oe-lkp@lists.linux.dev; lkp <lkp@intel.com>; Sang, Oliver <oliver.sang@=
intel.com>
Subject: [opencloudos:next] [mbuf] 07131e4097: hackbench.throughput -24.3% =
regression



Hello,

kernel test robot noticed a -24.3% regression of hackbench.throughput on:


commit: 07131e40971dc46a24d28e8ba9fdcf3f7266c398 ("mbuf: backport mbuf func=
tions for memcontrol/cpuacct from tk3") https://gitee.com/OpenCloudOS/OpenC=
loudOS-Kernel.git next

testcase: hackbench
test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emeral=
d Rapids) with 256G memory
parameters:

	nr_threads: 100%
	iterations: 8
	mode: process
	ipc: pipe
	cpufreq_governor: performance


we found the most change in this commit is wrapped by CONFIG_RQM, however, =
the config used for both parent and this commit which is uploaded to [1] do=
es not include this config:
# CONFIG_RQM is not set

please advise if we must include this config while testing this branch. tha=
nks


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes:=20
| https://lore.kernel.org/oe-lkp/202406281349.948dca73-oliver.sang@intel
| .com


Details are as below:
---------------------------------------------------------------------------=
----------------------->


[1]
The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240628/202406281349.948dca73-oliv=
er.sang@intel.com


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/tbo=
x_group/testcase:
  gcc-13/performance/pipe/8/x86_64-oc_stream_base_config/process/100%/debia=
n-12-x86_64-20240206.cgz/lkp-emr-2sp1/hackbench

commit:=20
  63d5ef6b1a ("btrfs: make sure that WRITTEN is set on all metadata blocks"=
)
  07131e4097 ("mbuf: backport mbuf functions for memcontrol/cpuacct from tk=
3")

63d5ef6b1a20a2c8 07131e40971dc46a24d28e8ba9f
---------------- ---------------------------=20
         %stddev     %change         %stddev
             \          |                \ =20
  29145324 =B1  7%    +193.6%   85561293 =B1 81%  cpuidle..usage
     13.86 =B1 50%      -5.2        8.65 =B1  9%  mpstat.cpu.all.idle%
      0.02 =B1 11%      +0.0        0.03 =B1 41%  mpstat.cpu.all.soft%
     48132 =B1 25%     -73.6%      12724 =B1 95%  perf-c2c.HITM.local
     37775 =B1 25%     -57.5%      16052 =B1 54%  perf-c2c.HITM.remote
     85907 =B1 25%     -66.5%      28777 =B1 72%  perf-c2c.HITM.total
    356.33 =B1 28%   +1168.7%       4520 =B1153%  proc-vmstat.numa_pages_mi=
grated
   3510080 =B1  2%      +6.9%    3750764 =B1  3%  proc-vmstat.pgfault
    356.33 =B1 28%   +1168.7%       4520 =B1153%  proc-vmstat.pgmigrate_suc=
cess
    245.60 =B1 27%     +77.3%     435.38 =B1 48%  sched_debug.cfs_rq:/.avg_=
vruntime.stddev
    659.07 =B1 50%    +123.2%       1471 =B1 61%  sched_debug.cfs_rq:/.left=
_vruntime.avg
    245.60 =B1 27%     +77.3%     435.39 =B1 48%  sched_debug.cfs_rq:/.min_=
vruntime.stddev
    659.23 =B1 50%    +123.2%       1471 =B1 61%  sched_debug.cfs_rq:/.righ=
t_vruntime.avg
     62.68 =B1 48%     +84.8%     115.83 =B1 32%  sched_debug.cfs_rq:/.util=
_est_enqueued.avg
     39.08 =B1 81%    +375.3%     185.74 =B1 62%  sched_debug.cpu.clock.std=
dev
    202.78 =B1 20%     +62.2%     328.87 =B1 29%  sched_debug.cpu.clock_tas=
k.stddev
      0.00 =B1 73%    +367.0%       0.00 =B1 58%  sched_debug.cpu.next_bala=
nce.stddev
   3353056           -24.3%    2538341        hackbench.throughput
   3190453           -29.8%    2240539 =B1 14%  hackbench.throughput_avg
   3353056           -24.3%    2538341        hackbench.throughput_best
   2768362 =B1  4%     -32.1%    1880416 =B1 28%  hackbench.throughput_wors=
t
     80.45           +43.0%     115.04 =B1 16%  hackbench.time.elapsed_time
     80.45           +43.0%     115.04 =B1 16%  hackbench.time.elapsed_time=
.max
 1.153e+08 =B1  4%     +24.1%  1.431e+08 =B1  6%  hackbench.time.involuntar=
y_context_switches
     16453           +48.3%      24393 =B1 14%  hackbench.time.system_time
 4.583e+08 =B1  4%     +33.3%  6.109e+08 =B1 15%  hackbench.time.voluntary_=
context_switches
     28.09 =B1  2%      +3.5       31.55        perf-stat.i.cache-miss-rate=
%
 4.285e+08 =B1  8%      +8.1%  4.633e+08 =B1  3%  perf-stat.i.cache-misses
    438317 =B1  9%     +45.1%     635850 =B1 29%  perf-stat.i.cpu-migration=
s
      0.97 =B1  6%     -21.2%       0.77 =B1  3%  perf-stat.i.ipc
     22.44 =B1 14%     -36.7%      14.20 =B1 27%  perf-stat.i.major-faults
      0.56 =B1 44%     +73.2%       0.96 =B1 18%  perf-stat.overall.MPKI
      0.11 =B1 44%      +0.1        0.17 =B1 16%  perf-stat.overall.branch-=
miss-rate%
     23.29 =B1 44%      +8.0       31.33        perf-stat.overall.cache-mis=
s-rate%
      0.82 =B1 44%     +58.8%       1.30 =B1  2%  perf-stat.overall.cpi
 3.481e+08 =B1 45%     +30.3%  4.536e+08 =B1  3%  perf-stat.ps.cache-misses
    348183 =B1 45%     +78.2%     620512 =B1 31%  perf-stat.ps.cpu-migratio=
ns
     21.67 =B1 30%     -19.6        2.07 =B1212%  perf-profile.calltrace.cy=
cles-pp.process_simple.reader__read_event.perf_session__process_events.reco=
rd__finish_output.__cmd_record
     21.38 =B1 34%     -19.3        2.03 =B1212%  perf-profile.calltrace.cy=
cles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event=
.perf_session__process_events
     20.75 =B1 35%     -18.7        2.03 =B1212%  perf-profile.calltrace.cy=
cles-pp.ordered_events__queue.process_simple.reader__read_event.perf_sessio=
n__process_events.record__finish_output
     25.21 =B1 30%     -16.7        8.48 =B1 99%  perf-profile.calltrace.cy=
cles-pp.record__finish_output.__cmd_record
     25.20 =B1 30%     -16.7        8.48 =B1 99%  perf-profile.calltrace.cy=
cles-pp.perf_session__process_events.record__finish_output.__cmd_record
     25.16 =B1 30%     -16.7        8.47 =B1 99%  perf-profile.calltrace.cy=
cles-pp.reader__read_event.perf_session__process_events.record__finish_outp=
ut.__cmd_record
     18.53 =B1  8%     -12.0        6.51 =B1105%  perf-profile.calltrace.cy=
cles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_=
user_mode_loop
     18.53 =B1  8%     -12.0        6.51 =B1105%  perf-profile.calltrace.cy=
cles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mod=
e_loop.exit_to_user_mode_prepare
     17.91 =B1  8%     -11.5        6.46 =B1105%  perf-profile.calltrace.cy=
cles-pp.__fput.task_work_run.do_exit.do_group_exit.get_signal
     17.91 =B1  8%     -11.5        6.46 =B1105%  perf-profile.calltrace.cy=
cles-pp.task_work_run.do_exit.do_group_exit.get_signal.arch_do_signal_or_re=
start
     17.63 =B1  9%     -11.2        6.38 =B1105%  perf-profile.calltrace.cy=
cles-pp.perf_event_release_kernel.perf_release.__fput.task_work_run.do_exit
     17.63 =B1  9%     -11.2        6.40 =B1105%  perf-profile.calltrace.cy=
cles-pp.perf_release.__fput.task_work_run.do_exit.do_group_exit
     16.57 =B1 10%     -10.6        5.94 =B1105%  perf-profile.calltrace.cy=
cles-pp.event_function_call.perf_event_release_kernel.perf_release.__fput.t=
ask_work_run
     16.55 =B1 10%     -10.6        5.94 =B1105%  perf-profile.calltrace.cy=
cles-pp.smp_call_function_single.event_function_call.perf_event_release_ker=
nel.perf_release.__fput
      2.38 =B1 54%      -1.6        0.73 =B1118%  perf-profile.calltrace.cy=
cles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault=
.asm_exc_page_fault
      2.67 =B1 31%      -1.6        1.06 =B1113%  perf-profile.calltrace.cy=
cles-pp.asm_exc_page_fault
      2.15 =B1 36%      -1.4        0.75 =B1117%  perf-profile.calltrace.cy=
cles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_faul=
t
      2.28 =B1 34%      -1.4        0.89 =B1112%  perf-profile.calltrace.cy=
cles-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      2.28 =B1 34%      -1.4        0.89 =B1112%  perf-profile.calltrace.cy=
cles-pp.exc_page_fault.asm_exc_page_fault
      2.14 =B1 16%      -1.2        0.93 =B1102%  perf-profile.calltrace.cy=
cles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.12 =B1 14%      -1.2        0.93 =B1102%  perf-profile.calltrace.cy=
cles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
      1.14 =B1 31%      -0.7        0.44 =B1105%  perf-profile.calltrace.cy=
cles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_int=
errupt.__sysvec_apic_timer_interrupt
     22.71 =B1 25%     -20.6        2.08 =B1212%  perf-profile.children.cyc=
les-pp.process_simple
     21.77 =B1 31%     -19.7        2.03 =B1212%  perf-profile.children.cyc=
les-pp.ordered_events__queue
     21.39 =B1 34%     -19.4        2.03 =B1211%  perf-profile.children.cyc=
les-pp.queue_event
     27.57 =B1 21%     -19.1        8.51 =B1 98%  perf-profile.children.cyc=
les-pp.reader__read_event
     27.57 =B1 21%     -19.0        8.52 =B1 98%  perf-profile.children.cyc=
les-pp.perf_session__process_events
     25.21 =B1 30%     -16.7        8.48 =B1 99%  perf-profile.children.cyc=
les-pp.record__finish_output
     20.74 =B1  9%     -12.9        7.88 =B1102%  perf-profile.children.cyc=
les-pp.do_exit
     20.74 =B1  9%     -12.9        7.88 =B1102%  perf-profile.children.cyc=
les-pp.do_group_exit
     18.59 =B1  8%     -12.1        6.52 =B1105%  perf-profile.children.cyc=
les-pp.arch_do_signal_or_restart
     18.53 =B1  8%     -12.0        6.52 =B1105%  perf-profile.children.cyc=
les-pp.get_signal
     18.78 =B1  9%     -11.7        7.10 =B1103%  perf-profile.children.cyc=
les-pp.__fput
     18.40 =B1  9%     -11.4        6.96 =B1 98%  perf-profile.children.cyc=
les-pp.task_work_run
     19.15 =B1  9%     -11.3        7.86 =B1 78%  perf-profile.children.cyc=
les-pp.exit_to_user_mode_loop
     17.63 =B1  9%     -11.2        6.40 =B1105%  perf-profile.children.cyc=
les-pp.perf_event_release_kernel
     17.63 =B1  9%     -11.2        6.40 =B1105%  perf-profile.children.cyc=
les-pp.perf_release
     19.28 =B1  9%     -10.8        8.44 =B1 67%  perf-profile.children.cyc=
les-pp.exit_to_user_mode_prepare
     16.59 =B1 10%     -10.6        5.95 =B1105%  perf-profile.children.cyc=
les-pp.event_function_call
     16.57 =B1 11%     -10.6        5.95 =B1105%  perf-profile.children.cyc=
les-pp.smp_call_function_single
      5.68 =B1 26%      -3.4        2.32 =B1106%  perf-profile.children.cyc=
les-pp.asm_exc_page_fault
      4.52 =B1 29%      -2.7        1.85 =B1105%  perf-profile.children.cyc=
les-pp.exc_page_fault
      4.50 =B1 29%      -2.7        1.84 =B1106%  perf-profile.children.cyc=
les-pp.do_user_addr_fault
      4.22 =B1 28%      -2.6        1.58 =B1108%  perf-profile.children.cyc=
les-pp.handle_mm_fault
      4.06 =B1 29%      -2.6        1.48 =B1110%  perf-profile.children.cyc=
les-pp.__handle_mm_fault
      2.37 =B1 29%      -1.5        0.90 =B1111%  perf-profile.children.cyc=
les-pp.do_fault
      2.14 =B1 29%      -1.3        0.80 =B1113%  perf-profile.children.cyc=
les-pp.do_read_fault
      2.03 =B1 32%      -1.3        0.76 =B1112%  perf-profile.children.cyc=
les-pp.filemap_map_pages
      0.92 =B1 26%      -0.7        0.27 =B1103%  perf-profile.children.cyc=
les-pp.__lookup_slow
      1.03 =B1 24%      -0.6        0.45 =B1103%  perf-profile.children.cyc=
les-pp.d_alloc_parallel
      0.86 =B1 27%      -0.6        0.30 =B1110%  perf-profile.children.cyc=
les-pp.d_alloc
      0.37 =B1 52%      -0.2        0.13 =B1126%  perf-profile.children.cyc=
les-pp.copy_pte_range
      0.02 =B1223%      +0.2        0.23 =B1 48%  perf-profile.children.cyc=
les-pp.rseq_get_rseq_cs
      0.04 =B1141%      +0.2        0.26 =B1 38%  perf-profile.children.cyc=
les-pp.__get_user_8
      0.08 =B1141%      +0.8        0.90 =B1 86%  perf-profile.children.cyc=
les-pp.mutex_spin_on_owner
      0.42 =B1 46%      +0.9        1.33 =B1 48%  perf-profile.children.cyc=
les-pp.pick_next_task_fair
      0.26 =B1 56%      +2.2        2.46 =B1 87%  perf-profile.children.cyc=
les-pp.entry_SYSCALL_64
      0.10 =B1143%      +2.9        2.98 =B1129%  perf-profile.children.cyc=
les-pp.__mutex_lock
      0.45 =B1 57%      +3.2        3.70 =B1 83%  perf-profile.children.cyc=
les-pp.mutex_lock
      0.17 =B1 65%      +3.6        3.82 =B1 87%  perf-profile.children.cyc=
les-pp.schedule
      1.39 =B1 32%      +4.1        5.46 =B1 61%  perf-profile.children.cyc=
les-pp.__schedule
      0.00            +6.6        6.62 =B1134%  perf-profile.children.cycle=
s-pp.atime_needs_update
      0.04 =B1141%      +6.8        6.79 =B1132%  perf-profile.children.cyc=
les-pp.touch_atime
      0.06 =B1147%     +16.5       16.58 =B1101%  perf-profile.children.cyc=
les-pp.pipe_write
      0.10 =B1109%     +16.8       16.92 =B1103%  perf-profile.children.cyc=
les-pp.pipe_read
     51.52 =B1 17%     +17.9       69.43 =B1 17%  perf-profile.children.cyc=
les-pp.do_syscall_64
      2.05 =B1 11%     +17.9       19.97 =B1 81%  perf-profile.children.cyc=
les-pp.vfs_write
     51.56 =B1 17%     +18.4       70.01 =B1 18%  perf-profile.children.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
      2.05 =B1 11%     +18.5       20.56 =B1 81%  perf-profile.children.cyc=
les-pp.ksys_write
      2.09 =B1 13%     +22.2       24.29 =B1 83%  perf-profile.children.cyc=
les-pp.write
     21.12 =B1 35%     -19.1        2.03 =B1212%  perf-profile.self.cycles-=
pp.queue_event
     16.46 =B1 11%     -10.6        5.87 =B1105%  perf-profile.self.cycles-=
pp.smp_call_function_single
      0.23 =B1 54%      -0.2        0.05 =B1108%  perf-profile.self.cycles-=
pp.fput
      0.00            +0.1        0.10 =B1 49%  perf-profile.self.cycles-pp=
.__flush_smp_call_function_queue
      0.04 =B1141%      +0.2        0.24 =B1 38%  perf-profile.self.cycles-=
pp.__get_user_8
      0.04 =B1141%      +0.7        0.74 =B1 95%  perf-profile.self.cycles-=
pp.__schedule
      0.08 =B1141%      +0.8        0.89 =B1 86%  perf-profile.self.cycles-=
pp.mutex_spin_on_owner
      0.10 =B1 82%      +1.0        1.15 =B1 88%  perf-profile.self.cycles-=
pp.read
      0.38 =B1 52%      +3.0        3.34 =B1 83%  perf-profile.self.cycles-=
pp.mutex_lock




Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

