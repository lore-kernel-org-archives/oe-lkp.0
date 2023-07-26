Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC5BA20
	for <oe-lkp@lists.linux.dev>; Wed, 26 Jul 2023 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690362450; x=1721898450;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=olj/ac544F9oFdTDxddDfzwYYdns9GKVGokPTymshc4=;
  b=TvU3HSTHvzjplBQn2YQQg6TP/ft63f+9y2r+ChSC7OLu64P/Q23XT6YX
   TTulikxesYwANy2xf2d7td1IECNpWCvtdIhmj260M/fmM11nK7aRs+oJn
   ILCzECApI0EzSI1CeUJ0aNNrQJ/xCl2TVXnB0CrDFBY2X+Fi3ALY/aKYw
   3CIlYTFOi1bmn2RwYYekmslCHTG/YYZJoXIY99NtmRmEgXmWtuBrtNakv
   RS0EWA0RBVxklA5lE4KAZyAP3/YbT13Z8LHIxk6EVQWr1W6t0j7IO8574
   IHTUNTZPPMvdDyq5TXCw2XtzzKN5EM1LbrD0J+SImbh9Ev22uY+3N8nBQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370637113"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370637113"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 02:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1057136202"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="1057136202"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2023 02:07:28 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 02:07:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 02:07:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 02:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv5E2tlpRE0EoIzpn+lVvJb/58GNWhTH2zD6FURT4AWhZB30vagfEkxyjiqz462Uv2zsDBgPiQbfTRwda2pzuuePib8HlIusQnJdKxoDA5C/iXc+2eXU4lqzxKxYicV237XnLOJ/s+6EQs1nFOnX/mewm3mknzepT2a0jpK+7O8XtNHkYVNn9wGEgO0+0uaUlLUb+D1caFAgA8K62UYPWm/YNY6IhtfGjS3AZGFNYKO+J6iNsT0cFpKMLa8PDV6G9VU2KMb2VCxi/TNrbFigAsu6S9A4Fe1qprQE5GTJqJ3tlVpFEJiS0celQrCXDQmiyPkojGu2wGwSz06cQ25sfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7a5EER7DoLUnq5e6U4NjPw5s7uBTbSh9cmlHX/H9+U=;
 b=d5O9CCew16/YWRiEzQRA8AZvvartKs/fB6segW2tZqFU7tEYGvmxEUSvcwYMvkSocdyxa6dpbUs/EZBkQ0mYzDKE3ievCHg5QE2xV37DiYt4WbGxE4we33Z8cK92CGMR3bLUN748s5VEbKFLF4RjUxEdbtHdTs8Lcab54uf9FtyXMsoCfvd74P7YnOS7P4fbrhULUCxw/tKYHggxPJUHpEWs05CzWyS+CJi31+J7Gp+/vLFUa4Zv10KmpBWvB3k3KEPJKMvGygAoBJyZJBWa1kc6Tt63p1VucppPmsEyAbsxTc84WEXkWjwEb2zcbc0lHYCarLslMfzf1PO5CAaHgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6780.namprd11.prod.outlook.com (2603:10b6:510:1cb::11)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Wed, 26 Jul
 2023 09:07:25 +0000
Received: from PH8PR11MB6780.namprd11.prod.outlook.com
 ([fe80::2803:94a7:314c:3254]) by PH8PR11MB6780.namprd11.prod.outlook.com
 ([fe80::2803:94a7:314c:3254%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:07:25 +0000
From: "Gao, Chao" <chao.gao@intel.com>
To: "Sang, Oliver" <oliver.sang@intel.com>
CC: "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>
Subject: RE: [intel-tdx:guest-hardening-rebased] [swiotlb]  36e8ff9c97:
 kernel-selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
 improvement
Thread-Topic: [intel-tdx:guest-hardening-rebased] [swiotlb]  36e8ff9c97:
 kernel-selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
 improvement
Thread-Index: AQHZv5hgLMmM5F2ptUm9a8H4XF1Nza/LwR9w
Date: Wed, 26 Jul 2023 09:07:24 +0000
Message-ID: <PH8PR11MB678052E2CC8D56B8D4DA83EF8D00A@PH8PR11MB6780.namprd11.prod.outlook.com>
References: <202307261507.e3351d3f-oliver.sang@intel.com>
In-Reply-To: <202307261507.e3351d3f-oliver.sang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6780:EE_|CH3PR11MB7761:EE_
x-ms-office365-filtering-correlation-id: 78eec8ab-75ca-4056-acec-08db8db7ba7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G08KNAY//ZnBW6VftN8AYQM0ssMIA952sX1QAoSCb5P/J3m9M1+pf1lUSc5VlpiCdH+EMmCVOiOFkVH3UgfF5A0MVuDno8E5eGE73sBCRxEGsCo8cIxNOFR0CxCPZ5RssucYcNm63fah8GODYPwX8tHIzxtlBrMIQyIp+OioAdM2UKcHpehQsN38uYzG2OCmoeSusQWo50vF7zCpQcAYaCDTFlGyIouIqXhev+BgRQ7cc3UfuDXLkl0OtuWe9T+OummNkNBW1QdjjwO1FnowCGA95kEzBLtI7ouqs/8HCtLIExSSkC8o1cj5ETrWCHbbOecG362gmM1VJzHZlViNqTz7hF7mWfNlA6mSfmHxCfEwUfhLXuCPCODvKGiNrqNJ33Gxo+rAECrS92wQ/GvbKwG+hAt/6AHsCowDpGYzEV7cMgpZxOMmvSX7I5RUXZnRBDg0UupmcXv750ZF+lzaPylGgeCBx3S7JHJgbZ4KCmiyuFaVrvcmlftz5dZHHsWx0dVaGXk8XLYQvWvrHSmfHocCAG8ktHLRffHFWCO/l2L0f2vtvuVDAbEgSGm6QP88srVs+SI9seOcsqQiPdkqBJG+laTRONl8h44T7dGrscyWdZZaLm9bFK0oh46NU8FPsjywm65ZKt4jOfAyL7wD7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6780.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(8936002)(5660300002)(52536014)(6862004)(8676002)(41300700001)(316002)(2906002)(66556008)(66476007)(66446008)(66946007)(64756008)(76116006)(6506007)(53546011)(38070700005)(38100700002)(55016003)(6636002)(26005)(966005)(86362001)(9686003)(7696005)(83380400001)(4326008)(478600001)(71200400001)(82960400001)(122000001)(33656002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UZ2n5Qps2cSAjYr8cVzcya0oSe8NnTD/ZDDWL9XTcL1fR4F9oxEucGxaGL?=
 =?iso-8859-1?Q?yyw2DTW7dUh7rykF4B9Vq0bL0+S90pyZzNedAmjN3GGKRJEfQkSKPpouMO?=
 =?iso-8859-1?Q?KgFcy3+r+qp9IH5mlRSKnYBSACxl11mLUT8brwt8JaRfydALishUv/SUtv?=
 =?iso-8859-1?Q?ftABFyKjNFpBHaILixWivA7nPM52mx7U8KtI+9TotjM+5ssP+wO0L00dZI?=
 =?iso-8859-1?Q?thSdBaNOevUaKkoxKFZM1aXCHgr0O1iAS91XcHT/CMTxJpQ7RJ2gQaJIkq?=
 =?iso-8859-1?Q?RygeY3QEjy8dSDtCjN1cRDPpe9MAEB4ZYl98lizoT37AV+ig+CaXi169Rx?=
 =?iso-8859-1?Q?okkvv4oUIUK3Xph5nI3tNRq/p3cVPQAwEqop0pDoKkhxVdp4ad/GG9dfzN?=
 =?iso-8859-1?Q?48Vvrxqw822PYJPhcQzzB8BiaXhBZHMXY7q3yeEsye/rAyfQ5Bsy7MJWuD?=
 =?iso-8859-1?Q?pTMXEoitclZjmTSXcX7OAUXNOUwl//9Di4cSUrtOLxHi4gyb0KUtKr7uuI?=
 =?iso-8859-1?Q?S2LT1L4Kpxx9IS+jBTssJBUK34x/VU3JqyM+QOOKpihoF3URiegMaNCocu?=
 =?iso-8859-1?Q?Mfwrx/+tR7aGIxTGVUHvL9QfbOHkTgpQzNJJejJ/FFs3emiW7ZSHvA4DGA?=
 =?iso-8859-1?Q?IU9P6/bNxpFVUDiXp8SdP2ntksTkPPzewb26dKryYQZAD+6BLlc8/KYs5h?=
 =?iso-8859-1?Q?MAcxbxP43F+iJHPHM/Ddx1Fpl3TTzQtFRSvtMA08KYhqMfKHwHils29LU9?=
 =?iso-8859-1?Q?BIM9jyhDzwn4F2xVceKGQYXENQT6kJXl2S5NMzRr3fBfPQH81S55aikCe/?=
 =?iso-8859-1?Q?2EBM84T+zo3NG4D/VWFyPXRYzk+J22ppNHk4iFSgrEvKg3nrm34O4PJ7hD?=
 =?iso-8859-1?Q?34foyPATY7z11GmcwqNq9tQNCE5Kyza9n8rXizGY2CsuCQc9car2PLV1uL?=
 =?iso-8859-1?Q?+ABZhNORiO8Lz4bgqrGyi+rckvW5vbX7IlremfgfXdT6exJbJ3W3PkxerY?=
 =?iso-8859-1?Q?VBmP3MPUsTWftSqu7FW81HZGkIX+KX8YkR6fLlNTbtmk45NHqSimESZjdA?=
 =?iso-8859-1?Q?fUJjmpucoC5MielpcQY7hOJ9SDSmj3P2FT867B3y2PY3i8vjwMv3XNi9Nk?=
 =?iso-8859-1?Q?vwy7tVahd2teCzghEr34FYm/6Fx2pERCBn80Q7/qhjsDnJLcnMijnBGBUf?=
 =?iso-8859-1?Q?SEsKNN9tIL4PgZ8sai8PqXZd0sQBTV9zhZ8ZZnevBfrWBJ5Vpo6yZsGbkU?=
 =?iso-8859-1?Q?au+6HSaf+JYg9vUooRxRVmeExkfid+XtKxi0g1JjansCrN1743d+rk0uhX?=
 =?iso-8859-1?Q?GFsehEISqquiSSdWUq/I0mR9Shf87Vlpk5ejkZEZGbkpp6PeRGiZmDwmmw?=
 =?iso-8859-1?Q?MrwNraCZCL/NYuW7jYgSZ8d+JEHN/JOHXK9NaQzzmlC3ThTcs0YrxWiSoK?=
 =?iso-8859-1?Q?q5CioXjzYydmZ9I+BPp07DUWdp5o4iAum8gb4iVLNNqrvEOG3vyrke3Ttk?=
 =?iso-8859-1?Q?h9g90T1pXOB2wcauQxaJJrhgLpbCOnfHPwz8znKWrfIzlpZUYIiwvkEI6X?=
 =?iso-8859-1?Q?gHElB37vWosCdUGoJbCv/+5jy7w6dqDfNhMaC3De4WbzSWxn8cPo/Ajeuz?=
 =?iso-8859-1?Q?FU4mTjg1R0sNk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78eec8ab-75ca-4056-acec-08db8db7ba7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 09:07:25.0006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MG2IhSbcOYiWQgPPZbbbAPAaETgVUXzDXXbALPcpdgxJkOVsnKXcMTdOL9QbGnmK24da8VYazt3YubweEpvb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
X-OriginatorOrg: intel.com

Hi Oliver,

How should I interpret the -33.3% improvement, i.e., is it an improvement o=
r regression? What's your expectation on me?

> -----Original Message-----
> From: Sang, Oliver <oliver.sang@intel.com>
> Sent: Wednesday, July 26, 2023 4:08 PM
> To: Gao, Chao <chao.gao@intel.com>
> Cc: oe-lkp@lists.linux.dev; Sang, Oliver <oliver.sang@intel.com>
> Subject: [intel-tdx:guest-hardening-rebased] [swiotlb] 36e8ff9c97: kernel=
-
> selftests.dma.dma_map_benchmark.average_unmap_latency -33.3%
> improvement
>=20
>=20
>=20
> Hello,
>=20
> kernel test robot noticed a -33.3% improvement of
> kernel-selftests.dma.dma_map_benchmark.average_unmap_latency on:
>=20
>=20
> commit: 36e8ff9c972448105048d404fd26be48fa4d7df1 ("swiotlb: use bitmap to
> track free slots")
> https://github.com/intel/tdx.git guest-hardening-rebased
>=20
> testcase: kernel-selftests
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz
> (Cascade Lake) with 32G memory
> parameters:
>=20
> 	group: group-01
>=20
>=20
>=20
> Details are as below:
> -------------------------------------------------------------------------=
-------------------------
> >
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/group:
>   lkp-csl-d01/kernel-selftests/debian-12-x86_64-20220629.cgz/x86_64-rhel-=
8.3-
> kselftests/gcc-12/group-01
>=20
>=20
> 06e94bd5b0f103a8 36e8ff9c972448105048d404fd2
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       0.40           -25.0%       0.30        kernel-
> selftests.dma.dma_map_benchmark.average_map_latency
>       0.30           -33.3%       0.20        kernel-
> selftests.dma.dma_map_benchmark.average_unmap_latency
>       0.17 =B1 26%      +0.0%       0.17 =B1 26%  kernel-
> selftests.dma.dma_map_benchmark.average_unmap_latency_stddev
>=20
>=20
> To reproduce:
>=20
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>=20
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>=20
>=20
>=20
>=20
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>=20
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

