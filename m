Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6816209681
	for <oe-lkp@lists.linux.dev>; Mon,  2 Dec 2024 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154058; cv=fail; b=WWurHkJGbv+d0GUWEBABhQqeE8jqOix7aGoV3RHJzlLXL9PLdtywAtdOI+IqP6Vs/UwgeGt7KL7btfcKJ5CGcsG85J89u2N4bYOUBc520VgbKpxU5OZhv7GrHZDHANca81L9WhEMvlrlssqxPHDsXQU+XusismmgRBBEm9dlkiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154058; c=relaxed/simple;
	bh=bOYrr6/4/fpvzkLWhKqhV0mbjeEuhkzmVezwA1kZ8+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EjdPtFW37DWhXXJaDAZLtMzkJMPRu15pYdBPfIp/5xeARpm71SGWoeobPKWZUcg8EM8Ahi/DZoc+xhyE9mbb+O1BzLMeiCS0oMDtuHlnUXSx+FGBSRzctAcsr0rmJPMOfMxCqj+VQ3gWqwSYqFzJAKmqh1yhHNYKoRrAX/gK0bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aefTI02M; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iR2I7EuE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aefTI02M";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iR2I7EuE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2DR5uS016663;
	Mon, 2 Dec 2024 15:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bOYrr6/4/fpvzkLWhKqhV0mbjeEuhkzmVezwA1kZ8+Q=; b=
	aefTI02Mc7m/kFC/2xLNku+2SP2tazZAPIhtAL26TPJnZfQjNiKe2/ll9rfixV2r
	SMgA1RahUauadoflZc+pZXDEDKLHC+WBMrYaQc2GrtAbOaeU4l1CQTeX/gwNN/n/
	zlf+VpO79UzBbVumpbYfXfVgjTMEl+zitakwWDmlUYcJ82TIy1mvgseT7b/dZWQa
	wjvUFo2U8z2+HtqodHZ6A+KG5UQqG2LwdVHwlcxxhsrLRdwWid9Ie9aRIF+rW+ux
	FaM4d0Y2PUi0r4qqqHzMlTwqCrmHCK9XSd9F3oyf6F5Q6/ScEgO6DpPW9gTP7KVl
	669xJY10MtHP1cH1BDDRlQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437u8t3p25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Dec 2024 15:40:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2F37AL001898;
	Mon, 2 Dec 2024 15:40:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s56k4gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Dec 2024 15:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VODkE7ejrosEA83olo+8qmeu/SC7Yfgix0dzVdyWCR7MNa50httWnNGlMHTQiyJ2cykUofsqHvBzqip10/xZ97+gPjTDim3uGuuc2bZCZb4kM0SGRTEH9+pL7b0gTvq6Y7c9xW710BNcD98/sqWZETvnIqmmRFC2RMSWlkSR+wARWgN4/dxtNuDTvB4UmGRaNajAlFrz+0NnTyDHk+6C5THVyiStMN1iVZHl4NGtA0ZJ35SJ7FRwWf/AtijsA3mT+9uJqAKOZhRxrc2sRF2ysHgB0n6YyLs9MkXp+WO7Gk8pdIbLWpMpFXmeXOlELHqFmty8+i5xPOQW9vpKEba9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOYrr6/4/fpvzkLWhKqhV0mbjeEuhkzmVezwA1kZ8+Q=;
 b=L9UFxDEDJJLvneplio+iXoVPFRYIucS0lc3UWXo2ownonE3lTXzFTER+4OxE2h0bbn97MosG4zHv3+04sK6b9SDeSWe+s93PhrVSEvMnNnHaoxxDEjDL/NXa87xI5VSF/MUmbjxlLZy5o0a54ldE+xqp/BEaRY1hwIIPSXKcVktY4QdUwxbDlDHsoJ5Af0IHVpiKmClK6xEyWEzdH5PYX4XwCeGsyeTEpQLqIZ+SaUjQgVx+rQlnE3OIfKwXtvLfdeb5b5uq/U2zKTjsdShd+mDqopQvhcNKF61862a25hA80WVLfNdxF+HfMTtlmoVJdommaz+lWkG2kaBFfJwTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOYrr6/4/fpvzkLWhKqhV0mbjeEuhkzmVezwA1kZ8+Q=;
 b=iR2I7EuE5Gn8WZ8bL65V3JfPzgvT9CcD3jB13RSyyMiimeNe8d5uAVohbGCZHU+nU8ECD6+g+Qm81c5xejueB12gEVvBR2dW4ZylVRqwxTRw230Wm7MfeSQ0RntUnhiNzdl14r35QRW/mD/wHz3mh0aaF0I7lRpfq8/e25DkJWA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 15:40:49 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 15:40:49 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Oliver Sang <oliver.sang@intel.com>
CC: Jeff Layton <jlayton@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com"
	<lkp@intel.com>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Thread-Topic: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
Thread-Index: AQHbMNFCR8jSrZBFk0KiMvLsFcBCRbK249QAgAXYbACAFoMwgA==
Date: Mon, 2 Dec 2024 15:40:49 +0000
Message-ID: <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
In-Reply-To: <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|MN2PR10MB4334:EE_
x-ms-office365-filtering-correlation-id: 54f84f7c-0b41-4f9d-bd06-08dd12e7b241
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RytJYUxBRHhmSWFHcjMxNkVVZjV3OE5EaGJ5Vm1NRWQ5WEZreGowZDAySXRu?=
 =?utf-8?B?a2kycndwUTFPbUZreU50UEdPbVB3VENaaEYzSXhKZW94RGdFa0d3WEhDMXZv?=
 =?utf-8?B?am9vQXd0VEV6OXl2b2l6bXRwbWlSRjMxVjR3eDR3MjFTSjVxSmw3Z2xFajNl?=
 =?utf-8?B?OVp0d3JtNWcwMUV4Q1ROMnRsY2pVc2hNKzdoRGR5RDUzVGlDa2c0ZUNZT1Bh?=
 =?utf-8?B?K01mYnJjMzNpb1FveDdMaVhxT1cyR3VUK2Z1SUpGcmFMSGJjcGZ0a2VkcEYr?=
 =?utf-8?B?R09pVG43dW1FSWNoS2dmSUYzTHluOXJPVFlTR1g4Sm1MaEdVU29paDEwV3JE?=
 =?utf-8?B?cXNBN0dlT0pvc2h1RE5YU3ZCZGFUMzJlOTRhOGEzblhiYnNOVWQrQ2xWVEJW?=
 =?utf-8?B?SURCS1hlV3ludWZyMkdrRVRFZHk3WkZsMUxuRjFqaWRjM0ZaaUtkTmlXRHJ3?=
 =?utf-8?B?VG1QZUc5ejVYUW5xSG8xQWREdnhCV2tWa1d5Ym8xOEVCZGk5M2RRZHlhek1s?=
 =?utf-8?B?U1U0R0FQMjhEMlpjaTZKcS9VRXh2WWZITytnT0tJbHViaGxUaUx0ZUZsd3Bl?=
 =?utf-8?B?ZlZNbEV5QWlEYU40S2x1amwvbzMyTE1TMFBqQXZCUkNpWldvU1g5TUZVQnRM?=
 =?utf-8?B?TFFZTzhxTERNbjJOSmRyUTRBTCs2cVB2QjNxM1V6OFdiSGJoVzBXM0xvcjVp?=
 =?utf-8?B?Zm15L2NqbGJlTitoeHZJaG9CN2RCcTNEUk5HT3lQUkRYNnpoT0hKa2toang5?=
 =?utf-8?B?U0pIWStVUDd0NmR2bDd3a2VMdWRqNHFMUWlpcEx6dFcvRmt2R2F2RUtaM1ZS?=
 =?utf-8?B?bk93VHJHQUtOSDlRK011TDhadkxOejRpTzRhek14VEdmMTAwZEQyMm5nUGQr?=
 =?utf-8?B?QWVIdmVqQzBTa2dwSFBaV3Eva0ZocU5xTzF6NmRYL1NQQXJkWGIwcGpFUTVL?=
 =?utf-8?B?YXptckxDaExWN0NVSTYxTUwzbUNMUWxIOGtZS25NVE16Q1FLNGVXZ21qOGFS?=
 =?utf-8?B?aVBxa2NYOTBQdG1GbWw2Q1ptUkJsWVA0MDY0TytLTHRKdDdITElYTkNHSUtP?=
 =?utf-8?B?Z0Z2WGM0dE1FOE0wbit6a0ZaSXpxZE05amZXbHpuTC8zZWtWSVBTUDFONjYx?=
 =?utf-8?B?d1RFNy96Z1B2Nlo3NWNhNVBDTDlBVUYvUGZkeVBibHY4QzJhc0JxRGtCN1ZZ?=
 =?utf-8?B?VmpZVHNEeTZjeVlCQkZ3T3YrNDQvODFmT3Z2ZjNXd0dzR0R4SDNZbEpVUWtL?=
 =?utf-8?B?K0E5dGdFZ0dETkhFRkFBRG9OQTl4d0NuNm5XcytGSzVrSmN2ZTFGOVcxekcy?=
 =?utf-8?B?NmtycjAwdEs3cFZVNG05dFZ0V1FKeXBmUHRJdTFtSnFZUDJTRFFBUW5FdUZy?=
 =?utf-8?B?T0FkcWYrWXVhYlhMSEFiWlorTzZJY0tIejBRbUNqN1lUaTU4a0drTDJ2Ulho?=
 =?utf-8?B?ZTBOaVN4Ym82OFQycEY4R0xKVUxIOG1WZG1wdGFuQWhOc2hmcFB1Tk5jK3kv?=
 =?utf-8?B?M2ZWaHR2L1dGRVJ4d2JvN0I4SjJwVVlTOVBQQ2l5OTVYd2xMdTkzS0lRejho?=
 =?utf-8?B?V2RSd21IeTlVWGo0N0pieVFTcUtlYzdTVDlkN1ZlOFhnTUxHVTRxSC9DWnRG?=
 =?utf-8?B?U1JkK2FMb0p6eWFyZWZrSzM5T1lGaFdqMUJRTjYzR1RHZVRtcS9lOVByMEZt?=
 =?utf-8?B?K0FwdFM1ZmY4dHV4dFpIV09SMGQxdGkyU3hDdWJYWFJJWjJpSlcxMVNDanZP?=
 =?utf-8?B?a0ZQZjRZa3VmbzdPc1NPZDRRMlU1QUZDRnY2ZGdPK1N1Y3pOWGNUSERCam5E?=
 =?utf-8?B?VGs3czdUQnlIVHBDSFhMaXoxTU9RNTNYQ3U1OGtQQjVLR2xyUXZrblI1Mitm?=
 =?utf-8?B?dE1ERmFyWEF3V3daa1U4a2p1UHNtSmpiMUxIMldHWk5ZSE4zQU5ocll3Tk4y?=
 =?utf-8?Q?d6z8hqjp1x4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHVVbGV2STVVVnlWSTlRMkVENGV1YURWVFlQTGVrUTlZUmtYODV0TVZDUzNX?=
 =?utf-8?B?eVphTktSb2p4N0pweEdlai9PR0tTVWtjQzQ3WmI4RkV1RzJDTVRDVVYvSjda?=
 =?utf-8?B?UFZhVUdycnNESVBJMVFyNm9VeE5TalNGY1ZJeGhFZ3lUalRhcVI2Ri9nSHpi?=
 =?utf-8?B?ekpiVXp2N3VHTEcvdVNPSlNiZVhmNnAzUGRTc0d4U3ZSR2lFMlFyNHkrdzF2?=
 =?utf-8?B?QXNOQlhJTjZGR0NvM0JyUnpLR1FHbk5ZR01GKzRlSkNjZjFja1JrWHJad1ND?=
 =?utf-8?B?bGVNejk5bStIWEM0RmJQcVJHSHdkalFIM1VyTFV6MXRFVDlhb2JONnlaTGlI?=
 =?utf-8?B?dFIzQUR5ZVhseTNxL1Z2LzluMURvOTM3S1IrZi9pL1p0SEUwRThoS0h6bjU1?=
 =?utf-8?B?SXYvb0J1amlGSExoY0thdFY4ZDBsVEdXOUZsYm5QWUpCeVF6Q2J0dW1NVzlW?=
 =?utf-8?B?ZGVOTit3cEFiZE03aGMvaVBDOWZ3dUZsRVcrV3FOWDlvbTBlUkJ0eis3WTJi?=
 =?utf-8?B?KzJxWnRxRjdTblRqem9HRk9RNXV1WElKRG5XWmNXdjlUTXRJWGFLenpjMVNE?=
 =?utf-8?B?Sy95OFlJV1BZSWt5Q0JvbWl3Z1VDT0Q4aDc3SnE4TzYzdlRkUU9SaldsVXJX?=
 =?utf-8?B?SWVkM2FzY0s5RDc0N0ZtUGRNb3Z1Y1F3dHlQUXI5TGd1L2EzREVpY2RUaStU?=
 =?utf-8?B?NEdjK3BxWWEvOU01TUVabElEM1hTdWFxTG12WnVFL2hUa3o4dGJORStzeUZm?=
 =?utf-8?B?dUtOYUloNU9FcnhxN0k2WGkrYnFXVDhWRnE2ekZYaGVQOHlnZWhiU3pGTUNK?=
 =?utf-8?B?LzdjNndHQm1tYzF1WjFRRXFqamtaTzVNQ0hBamVSZ1VXNWRMdFNzS0lIRGE3?=
 =?utf-8?B?YzZVVEhDa0RmS1hhd1d4RW9PT2Q3NHNzUDhCMnFHdHlaSFpMVTVOeEl2blJN?=
 =?utf-8?B?TnZwMjBDeXFLRDZ0U0hoYlU1OGJXNzBLYjk0V1hSc3hjaTlxSWZTaTVhd3VC?=
 =?utf-8?B?Vk1nRWxwMTdUaVhsUFczWDV3RjZhbEpOZXU0bkswbHV1Yjl5bndUeExDOXZm?=
 =?utf-8?B?SURINk94ajRlOW9sVzBZQXNyeWxQMEIvSXpMekxDWm0xeHBXbVpBdFlybjlD?=
 =?utf-8?B?NjBha05CT0ZaNG1jOVh2WXF3L0w1ajRMd1BQQkFGNWlpL2IwUS9ZUk1mTmZn?=
 =?utf-8?B?WGZlVEF2Wk12UDhOcGlWV3k2SjBBMFJ0NmJnZWVTSUVQZEVRK1JnNUdmbmVN?=
 =?utf-8?B?bWRZWVdkSmdRemd6bGhiTElyL0YrU2xHaVpsUVRid2RiS1Z4Q2YzLzgxTFRt?=
 =?utf-8?B?WmZnVkVWU2VxZmpjTVR3SWE5Q2tHQnd1d0tkWTJJTUdXK3E5S2RXNFlJa2Mx?=
 =?utf-8?B?L2dNYWZmWEhMN0dwK1RHMy9wTnVhNnp6ODY3RUtZVnVyd2t2a05ZRUxRQnk5?=
 =?utf-8?B?L2s5SmN5VE8zTzZzSHBYK1diVE5semdxdFc4YXozOGVoMVNmYnR3VlplalN0?=
 =?utf-8?B?NnNXckhzdTBhRDM2cnVpbkVONGIyR25KRTNjQjE0ekdhUEZoTXhCaVl5QUcw?=
 =?utf-8?B?a3NSSUdVaEptQTFlZHdUSG1PcFZ4NTYweUI5emZiVTBPQjRRZWx2M2N3WFpn?=
 =?utf-8?B?NVpOVzJtTjNyamdnU1VOa1p2OGhza2crUlpWbnA3c3FIUU0wckgzSzV4TXo5?=
 =?utf-8?B?ZVMzQ1U2Z2hyc28yWUFTSkJTMTFLSDVqTWJINTFrdjJveUd4aTFob3ZMQjJR?=
 =?utf-8?B?TTVTNHlrN3BVUHhqYVNFU1IxdGluUTkvVEpBb0Vhc292NGFUNGNSeE1lUzBt?=
 =?utf-8?B?QmRaemJZNVBXYjVvaWdHRHdpcHFiSGFIVGY1dlZGanV5YWl0b2s4UU1XTmp0?=
 =?utf-8?B?M2YrMW8rdzBGWjNKK1RwWW5uR2NJeDNKNVlUeFNZRWtPdDVVYXhndFUwQ1BL?=
 =?utf-8?B?dkFPVEIzRWZ5WlE4MjY1VnRwZjJJKzV3YmpVZ0M4QldkbUxtRElDWGxVcnln?=
 =?utf-8?B?M2dwMjBaNFhsWjZoNUw5bDN4STh4Q2lUb0RWUmVsUzVscVFaRnFZZnBYb2NU?=
 =?utf-8?B?TUt1NzgvOFZaNlZ4T2E5NE9nTVdwaWhhMlJuVzJyQUdiRXRKaVVqamhuc2FU?=
 =?utf-8?B?Q2FHcSthb21oczVBMk42RVdxOGE0TWpSZHBIZlBhY29PSW9vb3FwOGhyVHNx?=
 =?utf-8?B?VHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A63E4EA10AE544CAB2B809FAEDB68D9@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QT7Cjywpcwne31YxtR1by97Pn6Klyr6JBSRJiPuvhVS/RrqJtNyrIx1px3/OdCAuwsjXzfVSzeKFZ/3cW6571V5BNXv7ci1qLATXvLdCEbjSokHcAH6V09PhipeUKvUYO5MuQhp1dWhmrzch8N0GkLg7T9m4Tk9Lx8CtLJiRW8A7ewnrTAfeKwSmuZvvqsqu/SZx+WvoMhPr+ZB5qFF0CpgIf66dgRb7xk7qt3WBhBgiKwKRemW7Y8AEFRBXQ2Q7buSdCGMuqJZDpGW68FCm3WlWtqOM9332lBvrVrkFJMI2eH+O8a+7uRexrxCbEFf44WpUwowSp8oUBlkoyPEZWiBr1tmee1cx0MVpEeEo+3dp1nfhnKDCgkUW0sA4vrKz67DNq8/SLRRdRoyFh5J2oEQW1fXsvudlpL/gZlam8g5v8WajXSK6AA8Vcsje2ncnTSE/SCOzFYQPiTiQP6AUtWTRNfr3V3WyasMUGTrGt26q7xlYw+eubnxPUCjgaOatom0n7SbcK1FM+zKCLxwSanRtcXsDqpQeQQZwNDWMfzqTMq2C1X8l/GZfjqF4sxojZP1mTX0csoFhPKWA7OfUof1EV2ck8/CUU+xqnOOEQc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f84f7c-0b41-4f9d-bd06-08dd12e7b241
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 15:40:49.3584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f82iGr+ZQoMmZFwVLxyyH7eyp62F3liAhItpcet/pxLVLmyT/RVkgERRtBzNUjD3xCJsjKelCOdl3GLIBdalkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_11,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412020134
X-Proofpoint-ORIG-GUID: -NICUX22Y3EPGyPNDJ1muRgMMRqUrfoo
X-Proofpoint-GUID: -NICUX22Y3EPGyPNDJ1muRgMMRqUrfoo

DQoNCj4gT24gTm92IDE4LCAyMDI0LCBhdCAyOjUz4oCvQU0sIE9saXZlciBTYW5nIDxvbGl2ZXIu
c2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gaGksIENodWNrIExldmVyLA0KPiANCj4gT24g
VGh1LCBOb3YgMTQsIDIwMjQgYXQgMDk6Mzc6MzBBTSAtMDUwMCwgQ2h1Y2sgTGV2ZXIgd3JvdGU6
DQo+PiBPbiBUaHUsIE5vdiAwNywgMjAyNCBhdCAxMjo1NTowMlBNICswODAwLCBrZXJuZWwgdGVz
dCByb2JvdCB3cm90ZToNCj4+PiANCj4+PiBoaSwgSmVmZiBMYXl0b24sDQo+Pj4gDQo+Pj4gaW4g
Y29tbWl0IG1lc3NhZ2UsIGl0IGlzIG1lbnRpb25lZCB0aGUgY2hhbmdlIGlzIGV4cGVjdGVkIHRv
IHNvbHZlIHRoZQ0KPj4+ICJBcHAgT3ZlcmhlYWQiIG9uIHRoZSBmc19tYXJrIHRlc3Qgd2UgcmVw
b3J0ZWQgaW4NCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1sa3AvMjAyNDA5MTYxNjQ1
LmQ0NGJjZWQ1LW9saXZlci5zYW5nQGludGVsLmNvbS8NCj4+PiANCj4+PiBob3dldmVyLCBpbiBv
dXIgdGVzdHMsIHRoZXJlIGlzIHNpbGwgc2ltaWxhciByZWdyZXNzaW9uLiBhdCB0aGUgc2FtZQ0K
Pj4+IHRpbWUsIHRoZXJlIGlzIHN0aWxsIG5vIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgZm9yIGZz
bWFyay5maWxlc19wZXJfc2VjDQo+Pj4gDQo+Pj4gICAyMDE1ODgwIMKxICAzJSAgICAgKzkyLjAl
ICAgIDM4NzAxNjQgICAgICAgIGZzbWFyay5hcHBfb3ZlcmhlYWQNCj4+PiAgICAgMTguNTcgICAg
ICAgICAgICArMC4wJSAgICAgIDE4LjU3ICAgICAgICBmc21hcmsuZmlsZXNfcGVyX3NlYw0KPj4g
DQo+PiBCZWNhdXNlIHRoZSBtb3N0IHJlY2VudCB2ZXJzaW9uIG9mIHRoaXMgY29tbWl0IGRvZXMg
bm90IGFwcGVhciB0bw0KPj4gYWRkcmVzcyB0aGUgcmVwb3J0ZWQgcmVncmVzc2lvbiwgSmVmZiBz
dWdnZXN0ZWQgZHJvcHBpbmcgaXQuIEkndmUNCj4+IGRvbmUgdGhhdCBpbiB0aGUgYnJhbmNoIGJl
bG93LCB3aGljaCBpcyBiZWluZyBwcmVwYXJlZCBmb3IgdjYuMTMuDQo+PiANCj4+IA0KPj4+IGFu
b3RoZXIgdGhpbmcgaXMgb3VyIGJvdCBiaXNlY3QgdG8gdGhpcyBjb21taXQgaW4gcmVwby9icmFu
Y2ggYXMgYmVsb3cgZGV0YWlsDQo+Pj4gaW5mb3JtYXRpb24uIGlmIHRoZXJlIGlzIGEgbW9yZSBw
b3JwZXIgcmVwby9icmFuY2ggdG8gdGVzdCB0aGUgcGF0Y2gsIGNvdWxkDQo+Pj4geW91IGxldCB1
cyBrbm93PyB0aGFua3MgYSBsb3QhDQo+PiANCj4+IFRoZSBwcm9wZXIgYnJhbmNoIHRvIHRlc3Qg
aXM6DQo+PiANCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2NlbC9saW51eC5naXQvbG9nLz9oPW5mc2QtbmV4dA0KPiANCj4gdGhhbmtzIGZvciBpbmZv
cm1hdGlvbiEgdGhpcyByZXBvIGlzIHVuZGVyIGJvdCdzIG1vbml0b3JpbmcuDQo+IHVuZm9ydHVu
YXRlbHksIG91ciBjbHVzdGVyIHJ1biBpbnRvIHByb2JsZW1zIHRoZXNlIGRheXMgYW5kIG5lZWQg
c29tZSB0aW1lDQo+IHRvIGZ1bGwgYmFjay4gc28gaWYgdGhlcmUgaXMgc3RpbGwgcmVncmVzc2lv
biByZXBvcnRzLCBtYXliZSB3aWxsIGRlbGF5IHRvDQo+IGEgbGF0ZXIgdGltZS4NCg0KSGVsbG8g
T2xpdmVyIC0NCg0KVG8gYXZvaWQgcmVncmVzc2luZyB2Ni4xMywgd2UgcG9zdHBvbmVkIHRoaXMg
c2VyaWVzLg0KDQpUaGUgc2VyaWVzIGlzIG5vdyBpbiANCg0KICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jZWwvbGludXguZ2l0L2xvZy8/aD1uZnNkLXRl
c3RpbmcNCg0KQW5kIEkgd291bGQgbGlrZSB0aGUgcm9ib3QgdG8gaW5jbHVkZSB0aGF0IGJyYW5j
aCBpbiByZWd1bGFyDQp0ZXN0IHJ1bnMgZ29pbmcgZm9yd2FyZC4gSSB3aWxsIHRyeSB0byBwdXNo
IG5ldyBwYXRjaGVzIHRoZXJlDQpmaXJzdCBiZWZvcmUgcHVzaGluZyB0aGVtIHRvIG5mc2QtbmV4
dC4NCg0KLS0NCkNodWNrIExldmVyDQoNCg0K
