Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080851F7548
	for <oe-lkp@lists.linux.dev>; Tue,  3 Dec 2024 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733237700; cv=fail; b=MSZcLbjRf9rKmZpjxxZqBiNk6UZrcu3gyZl19wsbAISblbKXgOE2PX8DD9pjTyF8gFec4nx0ukkJuUhcjHbFlwFMguZIUjorYwT3zIZn50h+Plf/zl80j/yULfU7A7uceo+wQAQ8X80PzCx2qTPoguZbZBvVV7oImW87nre6bNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733237700; c=relaxed/simple;
	bh=ZCNZi9TcpLeGQey0lt/XNOBfUGo5rjaoPWdqV4WdGIY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I2Q5lZTiTYVmgdDXmhEwy8WODpYGJjvD3Xh1uWh+8wBgmT20CROyJKjjKuOyjwRp2F5qDzF6CBz38ztLUI84rzYWfCEQ9MdWMn0GD2XDRT0/0tFUXk+YTbiAZWyQmamhoLXih7GNKyf8nAMZDxZfBGJzQViYuJZbveTUB65MV40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Sfn+J2Nz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IMcgftzu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sfn+J2Nz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IMcgftzu"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37XwNq002794;
	Tue, 3 Dec 2024 14:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZCNZi9TcpLeGQey0lt/XNOBfUGo5rjaoPWdqV4WdGIY=; b=
	Sfn+J2Nz7kyaRiyAovMorDj7TynWglBcHoKMaO4mKPJTl9Gm4Cc4bxInPqFTjhyd
	0DmoB1nKhvgBu8eZAHvmPfgiw1sOhHJb/JCkGcqUKggpkLpZLVNk6xt/G51Qh40F
	1hQuLkby/3AgYu/AlGTc04+49v++q/k2zbxaD2bqh16SQXszxTTkmQKB2fcJkW2h
	yT8Dfy9dMIel0TZv6mWswgkHWVFZaSuToVbs7i2JnJp3TMdgT93EQDIyNzB9OBcO
	2a3pWOFcjDfrooJvxMLDRHEOGyFfyYsGNgCVsnl9O9AGh2/j08O+taSKnKRIQZww
	SIiW4n2Fu2Crg+WpwPq6gA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tas662x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 14:54:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3Dv4GY031023;
	Tue, 3 Dec 2024 14:54:53 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437wjcm0gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Dec 2024 14:54:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzcJ1dN5+WRuAw9ADoykCW19TrFkfUBho4kdbA5tzu5wIpQf2rrSd2ZXOmq0RrS8tvdQ592qt4W/b+55nCPr9quOk/wTB2emATYJXsHo6Nz7xMu3Ka46gYr7XhKG7ICKJCfBXfTskXRSSfhZa8s+MKrwy35WVjMJSIoF4JNsAAZL11x1JLa/VN1qeVPfmlXiS/G4pNijMIMMOIQHoox6GnkjclC9PBHK5YaIlYufokKIIGuoo/CWvXsXYLFXpY7ed4PDS514HFmFGH22/kIleuxnbaBJ8QsIORREGKFeadwVW1QPUVMnEAjU2XGZoHJLR1hHGpCRpUPWOmfCLFTWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCNZi9TcpLeGQey0lt/XNOBfUGo5rjaoPWdqV4WdGIY=;
 b=vWaUjjGSGBzbBUodC5mhWJZnMCp/e0gnHLxkuakBMeLw7jpPNyLywmq+gJPY69gP1JGWUoQUvCvhXGbflt+0HJYt4yLsOUqWXqCxp4w2BjMQEIzyhx+XuTek8t+FDIrnkbl30BFW0VRTJqnIdYrQKMgANcFkht/2v+k28SIOoA9JIrkWW9/OevsZrvP3qdZxmlE9zYlSk48yqqK20Bay3RZcrwR+7SGqm3bFr6euj0NfUN9Afj259e9Xdb9WBPb1WyzJ76CdQoVaXHJiRfGtSaTMDtT+57WENeSZJa8NgJVfpPvomJK8xMFEzLst4zY8qPXXzW1thRTTUo5wuw6f1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCNZi9TcpLeGQey0lt/XNOBfUGo5rjaoPWdqV4WdGIY=;
 b=IMcgftzuX71WzwkZsE7q4TBBwcRmypgvPNPtaaec/EYY1095bvVdIJfYJf2SG3j8ov8xmtGKCvxKVRaWD8pZnQ8MOYou3FZlzQ9biLdqIrXhITJ9f5xJX6WfmfK8lo3dx+L1i1gS7XNNGW/Trfd/b0DsmuPmpDKrir1L3wLxy4Q=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by SJ0PR10MB5582.namprd10.prod.outlook.com (2603:10b6:a03:3db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 14:54:47 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:54:47 +0000
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
Thread-Index: AQHbMNFCR8jSrZBFk0KiMvLsFcBCRbK249QAgAXYbACAFoMwgIAA38yAgAClqwA=
Date: Tue, 3 Dec 2024 14:54:47 +0000
Message-ID: <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
In-Reply-To: <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR10MB5128:EE_|SJ0PR10MB5582:EE_
x-ms-office365-filtering-correlation-id: 0aa04d39-61aa-4e9d-5d33-08dd13aa6e4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VVBOU3ZlWVQxZUpxNGpqQ2c5VS9odkxOTXpHb0VJMWw4dlRzVlpGZzdhNmtN?=
 =?utf-8?B?SmxPd0k4ZmtRenpTTUN4ZmRVVGtqTlk3V0pBdm5Cbmo1Q0N5M0o4NTBKZW5q?=
 =?utf-8?B?SlhicUloV2RtRjd0bDNON0xYLzBYSDN0SXhJVUEzcFFxVkFHbEwrMThYditE?=
 =?utf-8?B?Q0xRSFpKTnFNSGZwVnQzbVRPcWw1OUcvSHNyeEtUb0ZXanpZM1Y5M0hkejFx?=
 =?utf-8?B?ZUdZVUpocUVnMmQyZmlXcFhIWHlpWDNoSW9XdElPQ2lGdTEyZEdaNFdMeUNX?=
 =?utf-8?B?RGdPZTYyWU5tSlBGNHVQNXI2Z2syQm02Y1E4R21OdzhTSWJVUFRCWFRpS1Fh?=
 =?utf-8?B?ZDcydWg4b2h3VnorVWpxVzlEU0pweXZ3UXpubkUxQWxWYkliM2FEVGtZajhR?=
 =?utf-8?B?NUltVmVBTDZJQ21FeFlpc1c0S0QycnFBajNkTE5GRGF5Z0hrdDdER1ZReDdL?=
 =?utf-8?B?am1TL1FQTmhRVjkvUXUzZlIweXhhYUpnNkNramxkdE9rWGVpcDVQbU9BSVpG?=
 =?utf-8?B?b3pkNmFtVzY4UFJybnlFWEdITVVrbW5zRURVNUdwY2NQYWN4QzBvcDFPREYz?=
 =?utf-8?B?Z1pBa0pCNjMxUFZzNEpGOEJNQjljT3ZCbHM3bkF2K25POHk2S1ZqSER2RGZY?=
 =?utf-8?B?TkFKUXdvaWlKT0R5bUVFVW14Q05tMmJvMTAzeHJJd2JOL1FNTHBYMEY5Y1lJ?=
 =?utf-8?B?U1l4ZktkVlhzTWEvenFSclp4YVFDR2VjUlk4Y3BnR0xxSEZwUjMyN2QwSnpJ?=
 =?utf-8?B?alQ1TVA4SVVjT09vZ2R4bDBIUzFlZjdMNWJzMGh2emVwMm91Z0NucFY5RmQ1?=
 =?utf-8?B?djZSQ3FvenJ0WWVmcUtZN1FZSTQ0Rm45ZTdILytJTzA5VUJybUZCZ3hFc1I3?=
 =?utf-8?B?aVlpVzNSWldFeTFETmt5ZU5wN1pCNmg0Mk4vRHlYYUxWUFJqZTd5T0tUa3Rh?=
 =?utf-8?B?RnYzQnpxRnpLelRQa3hEcXY2QU55NmRxb002NG80am9CTG9aaEY5TUtLbVZ0?=
 =?utf-8?B?Q1QyN2hJc0RkUWkrczUweVNsVlRyd3hGRUxUUGlWU3RDeWd3Z3lhU1FoQ0x4?=
 =?utf-8?B?UDg5RUdVelJKbnZVNVJDOGJoU3hGMmpMQ2VHSmcwak9hVXFJMExqbmtKKzdt?=
 =?utf-8?B?WXc4T3F2NGM4Sjh2RWNQSUtVb2QwdEpVeFVrOFliM0ZpblZjMzU2U1dVYVRQ?=
 =?utf-8?B?TkJIRVNmeTRmVFp2STc1dUJqYW5TWWFFREhUL3N6RDhpaUJSV09sek50V0JW?=
 =?utf-8?B?d0JsQ0M3ZEhEOTc3cjhndFArY1BNSWFzOWN3Z1lsRUdOV0VkQnZ4VVZCa0ls?=
 =?utf-8?B?NVRVL0U2N2dtaU42cnZ6WHNXdkJmeThXVXNYYW05aUtxdklMMFcxbFRFdkx4?=
 =?utf-8?B?QzhSWVIzZjdUWFZGSm5lc1Q5bjNndlpySGtJYlNnUjJEUUgwTjNQTjRibU5D?=
 =?utf-8?B?Q1M2WDg4bDZEMFd4cXVTZm9xNXpiOHFxSGdEMnZXbDBqWDlkUXB6K2pEc2VL?=
 =?utf-8?B?N3QvSmR6aGtOc2pMQlExNHdVUFM1cHFQVnI0L1l1ZmRNaGt3dm44b01SNjNV?=
 =?utf-8?B?OTN4cVc1ZzFLSk1ieW1TOVljUkg2ZVpKZytBcmFWYlNwaGs1bzVVSXRUaTZq?=
 =?utf-8?B?WHc0QlRLTmhKWFdlTmJxdzBTVnhiMGdSbWFsa0FXQTEyS0Q2Wi9JUUZnVjlH?=
 =?utf-8?B?RlJmQTdobnJIeDZ1V2NLcjRiRGEwZmh0bTcwK3o3YnRYZmdjNzkvMHB5L2NZ?=
 =?utf-8?B?dVhMaGdZbDNWTEpDb3RyUkpNajJjUXJxQSswY05COWpPUCtGM2J1dnlrNFpE?=
 =?utf-8?B?cEZQZWQrZGtnTTlYTUZCanJOblNsRUJ2UHVOcjl4eHNrOUtkSmt4RVptdEJO?=
 =?utf-8?B?bmF2WGhWdmw4aTBnRWIzMzRQbkFYNWhIeEFySXpHMU5rTHJSQkZQU201ZU1F?=
 =?utf-8?Q?Qtj6N1/SfKw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OUJQWnJyR0tiNEtaOFF6UHJkaEhEaWpVV3d4RlM0MHY1WVFVMFRJRmtwUGdD?=
 =?utf-8?B?aHJpbkkvdENUcTdvRXJTdDNBTWdIcHg0SlVLbXlMbVZBVldvNVp0MHp4Z3I4?=
 =?utf-8?B?VHVSUVBZRTB0cDY4ZkpvUlJBdjJLM0RXbm01L2QvR0MzQlgyV0FRYkxLL25G?=
 =?utf-8?B?WUEvbjBRbmZDWHJqdE0wa2Z0S2hzQ1pWQk1uYnBEUkVZUFJKaDJkb3JpRlph?=
 =?utf-8?B?N1gxVVFwRXhwblRDQkdEdWVUYzFveE5qeTJpQmwwS3JmbEVSN0NBVzQvSkZQ?=
 =?utf-8?B?VldGUEJUeW1mSnZxcmtyQmVVdk0zUFRMU1llK0d1ZzdRSG12eXFkcFRmUk1k?=
 =?utf-8?B?cHRQamtVQmtnSXhzcWU1MWdCdis0b2hMMldKVWJlb1h3MUZVMERPeHNqK1dQ?=
 =?utf-8?B?R25Xcm5yR0Nob3l6UEd6MzJINUZoMERuTWpXUTVxZVJXWit0NXVlcis5M2kw?=
 =?utf-8?B?djdXbVhUTFZZL1pmTUFUM1hqMThnekhhbWRmTmVFWlBVWWtpcVhWclNGeDl6?=
 =?utf-8?B?MGs1RU9xbUJxeGNZdTllUkdoeSs5a1FiZlg4ZVJQYWNDQVMzeS9BNklrMDlz?=
 =?utf-8?B?MEFsV09BV2d5dFRVcUpHTi9TcGZXS0VCMUcwVjdFRm5YTEw5ZmUvcy9OQ0Zx?=
 =?utf-8?B?elkxU0o2alczRDFUSUtiNmtzcFZ3TXdYaTRyWlRIQUduT0NIUXNZRjZNUm9L?=
 =?utf-8?B?Vk9jcUhHNWltazZYQmlETGw2bEN3NXdZQzZ6YWhsWFQ0N0NKWVdOSTRxNHhZ?=
 =?utf-8?B?NFYzV3VYY2FoQ3diS3BjVHN4SzRyY2tEa0lPbHhqZk9NTlVENlpLS0NZRW0z?=
 =?utf-8?B?d25yN3lvTFY1aVQxdWwvWnovYmNGc3hOeSt1ZFgxWGltL0Nab0swaS9DcUF3?=
 =?utf-8?B?SHplK3c0Nlg5bmtoWVJ2Yk9UYm9VTGQzOVlLb0N2ZVVVSlVkdVpkN3dycjE1?=
 =?utf-8?B?VTAzTzdIQzdEZnFhQlpRcEE5OWNBRnFJR3Vmamw3djlDdVZXNVpiM2ZwcmU0?=
 =?utf-8?B?RXNpRENEOEk4SGxHTHQrVU9VbjhYcGlEZ2JYcVU2SzJidFp1MDdCamRuakow?=
 =?utf-8?B?bW41Q0MrdXVqazJOZjByVTA2elM2Nk15VzdEeHY0T0xuV1hSV2pWY2d3Qkxl?=
 =?utf-8?B?clFGNWc3cVMzNmJ2ZUh5M3N4c1Y0aXFOa2F6cGw5SGVESk9yZDliRUdjQ3FW?=
 =?utf-8?B?dU1HNEJ2MzliWDZQeE5iNHhGbngvK2p2R2VLQ21JRXBUMk9vbksvOTFRRFRu?=
 =?utf-8?B?MGozc0ZaZDhlNk9QY2xzM3FESU1pRUFURk1hbDkwOHRmQzd3d085MUZQN1pn?=
 =?utf-8?B?bUNrQllFVDl6MWJHeVJNaDRjbnp0NEdXM0dOQVNkam1jbEt5OTJyUDhkK0NK?=
 =?utf-8?B?QlU1bVcxeTVmR1BaODJUWWd0NWpsK3RtTmQwVmFhTzV3S2NMK0Y2NjB3NXgw?=
 =?utf-8?B?TnlMRHhxaGJLUVc0TEo1eUVkU1k0UEViMk92QndBQVpwRUM2S3pVTzRXTmxk?=
 =?utf-8?B?YkFxaGRETzZiVDE3aUkxQ2gzTFBPb2JhQ3NSZisvK042ck9xbkNJWURBOCtu?=
 =?utf-8?B?MUR2a05IdjFKTEpPQ3NpSVZmL2N4NnFqWWJBNGdGYjNMUVV4TmQ1L1JNZWNz?=
 =?utf-8?B?OFZWeDhkZGZpR1VoWUdpVW52aHQ2YmN4ajV1aWxTOWxaRkNmVXlib3hja2tM?=
 =?utf-8?B?elZzTmxCTWNWU0sxa2g0WVZjZkgvRExObk1qUjkvTGZFUTF5d0NPMHp5anVF?=
 =?utf-8?B?bWZ6bzBkdHhVU1UrSjN0S0VQdnNUT3FZMm1BSFdTNmJoTFhJNEdybkhCcHRu?=
 =?utf-8?B?T1h6YmdPcjhvSk00OHNMRzV5aGJRL3JMMzBpSUlwWXVPa0U5WENYbkdqS1Na?=
 =?utf-8?B?dnBxdlBERXFmWU1PR3N5SmRkV2tuakt5UzVnWC9TUzJYTlhqSytKNDVFT0VR?=
 =?utf-8?B?eWF4REkrd0hYZmM2eSs5MFdZUGgvMnZ0LzdoRzc2ekdSa0o1dkY5T2FZeThs?=
 =?utf-8?B?dUlTOXhpLzFsTGNNeTRtbWpDSW1pRDREZVUzQ1IyQk55cUdqc244bnNNV1pW?=
 =?utf-8?B?MWNwVW5RZ3d4cHZINXhTVVVoNDk0VnVhUzN4bjM1clZzTlJuOThTU2x6SXNT?=
 =?utf-8?B?VWtyalE4MTRRcTlHOGt6N0kzQ2VNaUhLUS80OGd6cjZibHRNdDVucFp5MzZG?=
 =?utf-8?B?U3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5127942D163B34B85A37170FE2ABAFE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cPWg6Rq5Gmeb+aN9o9LMdhCIbz/FWhf1xe+aqsRCJ+h5LSHXARgsVAt1bTM8o/IXQdrRsydTcIo38RAhp+i+iA2V3BGovmdtjiF+D8AV21K5zmY3+52LlGU+GRMoNjdkxFKsliVpwaGrApBRxeHmFp/ICw/sfP44VHCQCzBzknIZXNSuXODf5G/9p+pdJjFgZR2yDeqCOmXBv5sKY7AOmac/0Ouj+Q9d6XprVKe+Ebdtvt+CB4pzDH/RfbNwggrzSJJHHtkaS0OyefnlinN7hMXzGYU5or4jBPRYwquoNxL8o9kkkdSVUI2sO8zzxG3OH1bgH8F7NplKH+eT9nKrROPjaQEL7WC2G52AYnW9OChF2s75ej6Vzbz61IN/tG+GMMlmD3iynm1ZoquFz+v1BqQhy7LbzmjnWmcs1Dq28qdPXIY1CHLcksFCLp8qtxtHew2DYuCHauALvKcg8LmS2k83dqLhJI1iRLbmOp2+Mb4HFR4DL2CT42VIdOVz0ElUTEzLp0bF50cLqW21LgLjf1VedKPd+WmKncegUlz8FP0nNHqGzJoaZHrTLy/0XL6vlUNuOVpSwUoZ++1tJRFL1aAMCvFS6vnK7uoH9J29I4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa04d39-61aa-4e9d-5d33-08dd13aa6e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 14:54:47.2066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32JldFc29HpUhA26kWxRyLoUr+NP6NFqkqSFygB3//D2LACrYVdF89HsAerpv6+3zsoGYiceIn7zLfNy3v8J1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_04,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030127
X-Proofpoint-GUID: ZWiFXYafsMxWdEA7GNPxycmQOcQLY9Nm
X-Proofpoint-ORIG-GUID: ZWiFXYafsMxWdEA7GNPxycmQOcQLY9Nm

DQoNCj4gT24gRGVjIDMsIDIwMjQsIGF0IDEyOjAx4oCvQU0sIE9saXZlciBTYW5nIDxvbGl2ZXIu
c2FuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gaGksIENodWNrIExldmVyLA0KPiANCj4gT24g
TW9uLCBEZWMgMDIsIDIwMjQgYXQgMDM6NDA6NDlQTSArMDAwMCwgQ2h1Y2sgTGV2ZXIgSUlJIHdy
b3RlOg0KPj4gDQo+PiANCj4+PiBPbiBOb3YgMTgsIDIwMjQsIGF0IDI6NTPigK9BTSwgT2xpdmVy
IFNhbmcgPG9saXZlci5zYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gaGksIENodWNr
IExldmVyLA0KPj4+IA0KPj4+IE9uIFRodSwgTm92IDE0LCAyMDI0IGF0IDA5OjM3OjMwQU0gLTA1
MDAsIENodWNrIExldmVyIHdyb3RlOg0KPj4+PiBPbiBUaHUsIE5vdiAwNywgMjAyNCBhdCAxMjo1
NTowMlBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gaGks
IEplZmYgTGF5dG9uLA0KPj4+Pj4gDQo+Pj4+PiBpbiBjb21taXQgbWVzc2FnZSwgaXQgaXMgbWVu
dGlvbmVkIHRoZSBjaGFuZ2UgaXMgZXhwZWN0ZWQgdG8gc29sdmUgdGhlDQo+Pj4+PiAiQXBwIE92
ZXJoZWFkIiBvbiB0aGUgZnNfbWFyayB0ZXN0IHdlIHJlcG9ydGVkIGluDQo+Pj4+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9vZS1sa3AvMjAyNDA5MTYxNjQ1LmQ0NGJjZWQ1LW9saXZlci5zYW5n
QGludGVsLmNvbS8NCj4+Pj4+IA0KPj4+Pj4gaG93ZXZlciwgaW4gb3VyIHRlc3RzLCB0aGVyZSBp
cyBzaWxsIHNpbWlsYXIgcmVncmVzc2lvbi4gYXQgdGhlIHNhbWUNCj4+Pj4+IHRpbWUsIHRoZXJl
IGlzIHN0aWxsIG5vIHBlcmZvcm1hbmNlIGRpZmZlcmVuY2UgZm9yIGZzbWFyay5maWxlc19wZXJf
c2VjDQo+Pj4+PiANCj4+Pj4+ICAyMDE1ODgwIMKxICAzJSAgICAgKzkyLjAlICAgIDM4NzAxNjQg
ICAgICAgIGZzbWFyay5hcHBfb3ZlcmhlYWQNCj4+Pj4+ICAgIDE4LjU3ICAgICAgICAgICAgKzAu
MCUgICAgICAxOC41NyAgICAgICAgZnNtYXJrLmZpbGVzX3Blcl9zZWMNCj4+Pj4gDQo+Pj4+IEJl
Y2F1c2UgdGhlIG1vc3QgcmVjZW50IHZlcnNpb24gb2YgdGhpcyBjb21taXQgZG9lcyBub3QgYXBw
ZWFyIHRvDQo+Pj4+IGFkZHJlc3MgdGhlIHJlcG9ydGVkIHJlZ3Jlc3Npb24sIEplZmYgc3VnZ2Vz
dGVkIGRyb3BwaW5nIGl0LiBJJ3ZlDQo+Pj4+IGRvbmUgdGhhdCBpbiB0aGUgYnJhbmNoIGJlbG93
LCB3aGljaCBpcyBiZWluZyBwcmVwYXJlZCBmb3IgdjYuMTMuDQo+Pj4+IA0KPj4+PiANCj4+Pj4+
IGFub3RoZXIgdGhpbmcgaXMgb3VyIGJvdCBiaXNlY3QgdG8gdGhpcyBjb21taXQgaW4gcmVwby9i
cmFuY2ggYXMgYmVsb3cgZGV0YWlsDQo+Pj4+PiBpbmZvcm1hdGlvbi4gaWYgdGhlcmUgaXMgYSBt
b3JlIHBvcnBlciByZXBvL2JyYW5jaCB0byB0ZXN0IHRoZSBwYXRjaCwgY291bGQNCj4+Pj4+IHlv
dSBsZXQgdXMga25vdz8gdGhhbmtzIGEgbG90IQ0KPj4+PiANCj4+Pj4gVGhlIHByb3BlciBicmFu
Y2ggdG8gdGVzdCBpczoNCj4+Pj4gDQo+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NlbC9saW51eC5naXQvbG9nLz9oPW5mc2QtbmV4dA0KPj4+IA0K
Pj4+IHRoYW5rcyBmb3IgaW5mb3JtYXRpb24hIHRoaXMgcmVwbyBpcyB1bmRlciBib3QncyBtb25p
dG9yaW5nLg0KPj4+IHVuZm9ydHVuYXRlbHksIG91ciBjbHVzdGVyIHJ1biBpbnRvIHByb2JsZW1z
IHRoZXNlIGRheXMgYW5kIG5lZWQgc29tZSB0aW1lDQo+Pj4gdG8gZnVsbCBiYWNrLiBzbyBpZiB0
aGVyZSBpcyBzdGlsbCByZWdyZXNzaW9uIHJlcG9ydHMsIG1heWJlIHdpbGwgZGVsYXkgdG8NCj4+
PiBhIGxhdGVyIHRpbWUuDQo+PiANCj4+IEhlbGxvIE9saXZlciAtDQo+PiANCj4+IFRvIGF2b2lk
IHJlZ3Jlc3NpbmcgdjYuMTMsIHdlIHBvc3Rwb25lZCB0aGlzIHNlcmllcy4NCj4+IA0KPj4gVGhl
IHNlcmllcyBpcyBub3cgaW4gDQo+PiANCj4+ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9jZWwvbGludXguZ2l0L2xvZy8/aD1uZnNkLXRlc3RpbmcNCj4+
IA0KPj4gQW5kIEkgd291bGQgbGlrZSB0aGUgcm9ib3QgdG8gaW5jbHVkZSB0aGF0IGJyYW5jaCBp
biByZWd1bGFyDQo+PiB0ZXN0IHJ1bnMgZ29pbmcgZm9yd2FyZC4gSSB3aWxsIHRyeSB0byBwdXNo
IG5ldyBwYXRjaGVzIHRoZXJlDQo+PiBmaXJzdCBiZWZvcmUgcHVzaGluZyB0aGVtIHRvIG5mc2Qt
bmV4dC4NCj4gDQo+IGdvdCBpdC4gdGhpcyBuZnNkLXRlc3RpbmcgaXMgYWxyZWFkeSBpbiBvdXIg
bW9uaXRvci4NCj4gDQo+IDA3YjIzMzdkYzE1OGZiIChjZWwvbmZzZC10ZXN0aW5nKSBuZnNkOiBh
ZGQgc3VwcG9ydCBmb3IgRkFUVFI0X09QRU5fQVJHVU1FTlRTDQo+IDU0YjBlOWMzNzI3ZDJmIG5m
c19jb21tb246IG1ha2UgaW5jbHVkZS9saW51eC9uZnM0LmggaW5jbHVkZSBnZW5lcmF0ZWQgbmZz
NF8xLmgNCj4gZmNjNzU2YjkyY2U4MzIgbmZzZDogZml4IGhhbmRsaW5nIG9mIGRlbGVnYXRlZCBj
aGFuZ2UgYXR0ciBpbiBDQl9HRVRBVFRSDQo+IGEzNTQ3NDNkMzViNDliIG5mc2Q6IHRyYWNlOiBy
ZW1vdmUgcmVkdW5kYW50IHN0YXRlaWQgZXZlbiBkZWxlZ19yZWNhbGwNCj4gNDAzODRjODQwZWEx
OTQgKHRhZzogdjYuMTMtcmMxLA0KDQpUaGF0J3Mgbm90IHlldCBhIGNvbXBsZXRlIHNldCBvZiBy
ZXZpc2VkIHBhdGNoZXMuIFdlJ2xsIGdldA0KdGhlcmUgaW4gYSBmZXcgZGF5cy4NCg0KDQo+IGF0
IHRoZSBzYW1lIHRpbWUsIEkgdHJpZ2dlcmVkIHNhbWUgdGVzdHMgZm9yIG9yaWdpbmFsIHJlcG9y
dCB1cG9uIDA3YjIzMzdkYzE1OGZiDQo+IGFuZCB2Ni4xMy1yYzEsIHdpbGwgdXBkYXRlIHlvdSBy
ZXN1bHRzIGxhdGVyLg0KDQpUaGFua3MhDQoNCg0KLS0NCkNodWNrIExldmVyDQoNCg0K
