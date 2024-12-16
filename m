Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686991D618E
	for <oe-lkp@lists.linux.dev>; Mon, 16 Dec 2024 22:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734387842; cv=fail; b=JK7DVZnLT0xWGxC2p1+vWEHFMs6DLlspiR6bX6hPz2ixnDLKda63tsEXq3rrvJg54woF1MhRIVB/Q8ZRr+ZwTTjr+AoA96bCY05B9T49wl8OaU1ezFpkzmLhkgWKNGAaVHOBqVrd4+tkWc1TPJOLKZ4TpF04a7ri95IWs/ozcLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734387842; c=relaxed/simple;
	bh=gr4MSVp4aMj+AMi/dsQzte9HuWzBa9ltvphUWAM1/7c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AVD+j33hbOV7S7cLpLRWccPrHkN67YBA0RY5eulVCQylGppKPQifAFt8AeC07x0SVciHDOAEyh9dQigTh894lbqbCkQIP5AjfnLxAGRpVQdv5KkKZpGZopYareqk8KSEWks8DFvpjJxMBjJq+PhoQsxLaEI4ehQ1pshoIQrwztE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KKDO+gL1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QedZVXnK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KKDO+gL1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QedZVXnK"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGLXtL9027929;
	Mon, 16 Dec 2024 22:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=7+QcCMh2E+Yo/dWAysgulQwITBxG+x5aoGA/wZVBL/c=; b=
	KKDO+gL17zU7Pgc+ShdkIyrK1Djir/N97ADbafS69zXxC2XqZ9DRJ0dCHn1n5Ey4
	Cum3NuMpCzVKRCtqq4WtedvJyJ/KZBapn0kTiEUIcI7cePBzoT0IjzyD6cLYtnDs
	kdcoWNdg3Bu/yhKycm3J2cDss6b222DR0cGUHt69va5o9g27KT+YlDn2VrNlIXC6
	CYrN9p0fwVw3o0ozVYLBVtPUgXoF02NtzjWuTOVmbSGGZmPHqLtPiY1u78qd4+8v
	PrJ8+hVIue+e1eJZjpjHGOTMXIyZn97D6FxQ7VIpht4p/OZQy5h7fVRpeVFW2FT3
	jax1ljzAE/jFOmGJPqMOjw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h22cmha9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:23:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKOGrC006371;
	Mon, 16 Dec 2024 22:23:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0f8mcy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:23:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQBBd44X1ReK1gp0rId0agJqEOpRIusUazVzlzqDvaDoxD+2P0j1jN54DVK0Q9hYf7Pt/ap5QzQeJvsmifXGZT8Cdt2RgDS99zZB7hwS8M9tReOejdOMraj6b7X88B5qfZ3F2u8yWwaAycCVCc0o80g7u5mrdGa6+TbvS0JDzvYSLKDZ1Z0MOYF8+abaZBHc61lI7dk+VKuosAq32BXggDrMDONdPtR84JF6Y1LLz/+8N8rWnkVPeJaRRE5bJazKgXx0zZUysQbChJokXSzgpLYaiQUPWgZxoU2GC83r63iMpSSrwObwQQW9h97ar6e+ixK0WIcUeGhTL0P/UtyQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+QcCMh2E+Yo/dWAysgulQwITBxG+x5aoGA/wZVBL/c=;
 b=fyZddU2dy6kNIZE8kp+EDXkQvcDSgEAgeSUjGyaOqKbmZYxgs5G2EDXb6Wr+6jinJqckYAkCqkFcBI+gdtFdR6HA4bZJXWryDUeakzjQ73xr2JMkOrhEnMTi+wf776vJN/Xk2K2BSfaduM1DFgMq6G/ur/BGJM7L3+AvIiZ9bG+VaRcSCDkTg//VwuLes+OkZIWzUigZyOWyjWbNXjFQylFi+mHFt7KLFbgR2ZvSbYS23CA972+bm9xuxp4Aa1TX0dlHEWz1WCjWYUG6aafPrSQPeIsPzLX8ZNPhoCWa2Om3/ooraHX4cIhTaBFvxZ7mVp2O3ke+a6lMJl6RCG7uXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+QcCMh2E+Yo/dWAysgulQwITBxG+x5aoGA/wZVBL/c=;
 b=QedZVXnKcYotaA7Ids0B9Fwr23EKxqhl/Qi0AwZmm92Zmk9PPJRV6nTbSWZig+/sXMuaVxXCOSphKR8NguKFobhjSICG2LA/sO3Znx4bnUlIniMa6aY0CPWJX0IQoKvTuFVgrmGrBcj+8KwQ0KYDhGC6306whZfki9cfjI0QM7w=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by MN2PR10MB4174.namprd10.prod.outlook.com (2603:10b6:208:1dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 22:23:50 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::743a:3154:40da:cf90%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 22:23:49 +0000
Message-ID: <1e5c1ecd-7910-4033-a43a-c32007be55a3@oracle.com>
Date: Mon, 16 Dec 2024 17:23:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd] b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
To: Oliver Sang <oliver.sang@intel.com>, Jeff Layton <jlayton@kernel.org>
Cc: Mike Snitzer <snitzer@redhat.com>,
        "oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>,
        "lkp@intel.com" <lkp@intel.com>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
 <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
 <5fa3f3cf-2f95-4f0d-9625-8a171a10459f@oracle.com>
 <Z1Jilj43Pw/rblhR@xsang-OptiPlex-9020>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <Z1Jilj43Pw/rblhR@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0274.namprd03.prod.outlook.com
 (2603:10b6:610:e6::9) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|MN2PR10MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: d8867e4c-42cf-41c5-198d-08dd1e2050a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dE1ZYzNjbWVvWG1KU0FJNmlEUXFxeUk2NGRaK0cxTTBYTlBGTzVkb1AxUURv?=
 =?utf-8?B?OWRocVhJLzNwNW5MbGFVSWNnZHpjQU81TFZIQ1Z4NkE1akVGT1dUR0NGWW9Q?=
 =?utf-8?B?bEhOeHdCdWNlc0hocGQwNWMrV0pmVzFUdFg0R3B6a1RBQzhOWlIyNXVYTTRi?=
 =?utf-8?B?ZGxydXY0QTZDMU5weDI0NkZ5NlhoYXZQTHVTZjlwcUF0MEhxOVFjKy9UVFkx?=
 =?utf-8?B?TXhscEFqdXJoMGZsWGZMeTQ4UStOQTlaa0t3dTVpQ3ZvLzl2ODF5b0dFRXp5?=
 =?utf-8?B?eFI4aHo3L2ViK1ZmaWV6R3JxeC8yVk5PZ041Y0V0OWZ6Z0NwMTA4V2llR2h2?=
 =?utf-8?B?VE9LeDlFWFhOajdSQ294RFNmMTJrazVHdXU4VnNzeFd6cFBZazFQSk1XQ3kv?=
 =?utf-8?B?bVRtbDgrbzRzUFlPMjhRT2cxN0U4Tzl6Vm5qaUoxOXJSVkhRMWMyVFEvQ0F2?=
 =?utf-8?B?SExkZjU3VjBJZHlVcCtHUVBwdDVCdkl5RDQ5bVl5d2J0YXpSUXhvcHN1aExQ?=
 =?utf-8?B?cWNqc1hpV0V1elZ0a2JrMW1yR3RHQlA1cTN1TGdaZmZvelFWaDJ4cjFadzdx?=
 =?utf-8?B?ZDBwKzlENlJvZDF1YzB2UzNSZDBPbHZadjNsZDM2OFdNTWo1WDBhQ2lVbmZB?=
 =?utf-8?B?amNoUFRUQ21Hbi9Wc3lRTk96bkl1akNmejVvRTcwSHJZVll0WEhwV2c3QzlC?=
 =?utf-8?B?ZU1TSG81NlBWUkg5OWgyK2lXWGsyNjdzZFBCVzNBbnllWTFrWDVtU2JsQXRQ?=
 =?utf-8?B?MG1oWVdOZ1d2T1FjTzJmOGhtcUVFVS94R2I0Y2Yya1Nnc2pKSnZYaDBSenFq?=
 =?utf-8?B?MEs2eXNWMUw0UzIxVkhVY3hrbEl6K3daTjBydU44SkZjSWExMkhKZHJzMHp2?=
 =?utf-8?B?RzdwZ3pXSG9PUi90dzBCa3J1Rjc0OTZwWHhCWDNnc0dVQzBsbEpTOSt5cDU2?=
 =?utf-8?B?WlB1eVFMV0xVaHdyNnVZai9idFhKQnRqTEFXZVhuUmErVGNQRkxuL2tqM3hG?=
 =?utf-8?B?TE1EY0o1K2QydnFubkxyK0xqZUdtbEpJSEdWV2YxM0d5M0hZNzQ1ekUrdGtQ?=
 =?utf-8?B?VHAyWGw0ajFRSjEzNFZFOWxZV2o1TFVHMU9HS2sya3FvRWtKNTgzYTVkQ3pG?=
 =?utf-8?B?Slhjb05lZjdYYlBUUHZaZkZ0Z1luM051cFhPSFJtaXIvVGRYQ3A1Q1piaUhS?=
 =?utf-8?B?TEJDeXh6TUgzb2ZjSHhycmhMY3c4L0xTWWhzanNGYXk0ejZYV1kwNnVCN0tN?=
 =?utf-8?B?Y1hUeVh3NXpwLzBITXNaa21ldktWNWdXUk43dG5aSjFLVWxHa1VkRVVzUUFr?=
 =?utf-8?B?K2srd0pGcHk3VG01dVFKdng2TVYvQkNOdHZCRVN2Ym1sK0lLOWZJNktkRUFM?=
 =?utf-8?B?cTBmc3VSWWtvSm9Ub1B1VStJOG11QlNvQTdWMTVwTmNad3MyY2JtWjdmdksr?=
 =?utf-8?B?NXlrQ0s0eThEQ0w3ZjJpb2h1b2RiODRnajgzeGFLbGk0YVhoWFFUOGJlMVpP?=
 =?utf-8?B?Tmc1MnBKQjM2clpNTHlaK256VjV5TlVwZDJhWGRYYnFtbEJsbzhFRjVuZitt?=
 =?utf-8?B?elA3WGVIL1pRQXlVVGJlYW5nQW1uWGRVdlJ4ajlVOVRTMERuUFFwWnBndWVE?=
 =?utf-8?B?VTcxMnAySVNtWmE0MUR6MFNFN2QzSjZkcGFOQjJZNDROKzhDNHRDSnBzK3kr?=
 =?utf-8?B?RnNYanlwNlRBT3BnQW8xTWk1V0lCQ3Frc3hyUy9IaHdFa0Z1WFBxc1VnZjFF?=
 =?utf-8?B?dy9TTXRyM1F1YlVjaFVjTzdmeWlpelE5dktrYnBrS1djdlZ4VHlIQW1SMklv?=
 =?utf-8?B?ZlNvL0RrTjNVY0J5aDZSd3ZTaWppSTdTcnBwbHJPTUhnN2xmd1lIRnZWeE0r?=
 =?utf-8?Q?185KeA14w6KYG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RExSczFSamtwMTdkSGh5SFZUOGlpYk1GclJ0aHRYUlU3QzFIQ25DdENnUlJ6?=
 =?utf-8?B?eTZkc25QQTVLNm52dEl0SWN3bk5zYkVDRFlmcFd5cWl4TnR5ZHhIUDd1Tlp6?=
 =?utf-8?B?Rkx2dS9pVEJNcVVvc0ZsWFhBS0ZHNmhzUUN0bHozeVZLN3pHUk5wRStoSTVy?=
 =?utf-8?B?cHY3QnhlRWVhUm5wVjZVVTZmREFXQzlpUkFrUGI1M3JMeGtMcjhxM3REOFNM?=
 =?utf-8?B?OWNNMmdBbTRXQTlHUndvdXhTSEhESjRDdW5teFdURFMzd0hHS0ZpckcyRkxz?=
 =?utf-8?B?WS9LQVVzY2RlOWN1VWJuTzk2TTBnYkJ0SUMwcHU1ekxPektnSlRNSnlpRnhX?=
 =?utf-8?B?WDFpZU1XOUFSdDQ5azg5TzBTaitDY05WVVVtRk5zUjRyOWxlRUpYZ2NiV0x1?=
 =?utf-8?B?ejZzNkZzc2VaYVVNTjc1VGV3alhPbkRkM2xzcnpmdUxhT3VmemE2ZzhzZEQ0?=
 =?utf-8?B?Ykl1UklWL1QvL0VTbTN0ci9tcklyMEdlSnJQRDZWdXBhMVhmOGlib2x4NUhQ?=
 =?utf-8?B?WVhSMFdxbllIOHR0bXR6OERoV1oxMFRxQ3dkbVMreUd2eHhGOXVqZ2hlRU5I?=
 =?utf-8?B?Q1lGZmtCOTRQSE93YmxHYmFjR1pYbGMvUjNWeUpaU3lCZHJiQVlTaUV3blpm?=
 =?utf-8?B?RFVuTUF2cDRtdWlOaVJpQUJ5cStwRUJObzFNb29YVmJsdk40eFc5STZpSE1G?=
 =?utf-8?B?bzRTUXkwWTNYNis4eTV5L0JTSlF4VXU2THh0ZTBPUkVRUzdKMHZTQy9HbXl3?=
 =?utf-8?B?ekxLaG13akRJQXlQTWpmSUxiL2dvdXcwbTdZT2pidFJWSkVDVzVnTmRZc05X?=
 =?utf-8?B?c3M1a2lrakx3WmlRVkR2a2VVMG85RzBTc3BMVEZlZzVibWhmRWFESGFFRXFT?=
 =?utf-8?B?UGFNa29qNEhYRUUxSDVCdGJRMzdDRDl2U0l1VWYyck9vVDdOSTBEbFJKR2tz?=
 =?utf-8?B?MXVnZGtQVXRQd2c0ZE9GZUpka0wxYWRRbGxCWUVMYWpDMW4yaDB4aE1tZlRJ?=
 =?utf-8?B?bDlLZXgyRFNNc05xK1dRVytoNEFrZEl6QlkyRmlxK0VnV2VhbFlrbUxIbUth?=
 =?utf-8?B?amhjN2xGeFFQdXNPVi95WmtMQk1lc2kvVUxOY0FNa09CL2VtYUh6djVtV1Rw?=
 =?utf-8?B?MHNWai9zd2xtNDdMajIrTk1KWjNqNFI2Q3Y2ZVlreUlXWUdSaHljdXJ1eE82?=
 =?utf-8?B?SEQ1QjlqQTdkd2hJZkRKbVFSWmlKZVVKaUoza3ZoK0dlZTA4M1BqYzg4bEVT?=
 =?utf-8?B?dkRVVzFSN3MyWkx1WCt0SHBKYjIrem9YM09Qc3k3MkwvdUZaQnN2TmdUdDJN?=
 =?utf-8?B?Q0dnbDQ0VFBteXF2eWU5a0loRklCZjF4OVZJTEowVzlxb3dOMjZEYzJxQW53?=
 =?utf-8?B?cGhXak4yZEF4dkl3MWI0OVViNXNvdEUyOFh6Mnl6dTlCL0hSQ05RYTJoMDJh?=
 =?utf-8?B?cmdHb1dRb1V6VHZqa1VYL2ZvWHVQaWpIM21TRzhpVVpVNnljRkZjeU5SOGJ5?=
 =?utf-8?B?UmF3UHlzOGNpeE92N04xOXRkaFZYcjg3UGpOaHl4SG4yZE5VSFNJM2lXL3Bh?=
 =?utf-8?B?bUlOL0k5MUN4U2dSY0h4SDAyMzJXaHdtNmRPbWh4eTN5MDRFc1hFSDdNTDJS?=
 =?utf-8?B?dHdNZFQ3cFozOTVSeTNrQ2hsUDJnblNuL2NyK082ODkxZ3kzUW90WDMybnli?=
 =?utf-8?B?bjFHajlCb2k1UGowSHNLdHA2Y1dSNXYzeHMxZ2NUQXAxK0l2bVhzWVNLbnJW?=
 =?utf-8?B?eUhJbFRTcWZWQ0ZWdS9RVExuVDVid1d3QUZiZ3ltRDYrQUpPQ3BILzY5eHJ2?=
 =?utf-8?B?MWFsUWI4dUxMQitzN1hvMTNUbGF0NmNPMmR1bXRLQXZhclZKNG12blNXcVJ3?=
 =?utf-8?B?eitFVVVZK3pabTMrdHF4K2pka29SWnE1eGZoM0VkQWhEODg4bEpydFZqTnZ1?=
 =?utf-8?B?c01hdno2dzJ5aUhvK093Z2dxZTRBMmViSmdzUithNlhtdmlmc0xjY3NzeXpP?=
 =?utf-8?B?dkRaUkl2eWQ5Z2ZOODI4L2dYRGlKOGJzdjd0UWxQNEhFejA0UVd5SE9aemhz?=
 =?utf-8?B?VVdUUjZHSG9YMmJiMmVkMDlDSS95TmxLcjdFZG5pSS81UlplWm5XYWxEWHJk?=
 =?utf-8?Q?rWwB7xIINh/p4FEx+c8tIeNJO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kv45B9h1Mlax2gd0xrJTzTczsu1W1fmO0gyRWOVDb45TqVGwuKfx7kz4d+xVdMqLpQhTZ8nfSDjz6G2DyY/e7qn8LLWOsO+5hzvV8FaC1SYfNn5A6Z7d0OHgxZJpEFxaqYuDOnxWPAXnOnmG59Twfk5MFDkLMYP/6Z2XPFvqj8sNRWmZHcfq0E+K/7HG2KY71C7m/XX/NZVOL9kUuojuSwee3AGvKjifiFFVqm8gEmGULhRfA3uKEMlquvheoEFHbSv4AvwW7fg5JOhYRnE8GIxzzaTjzBm0+jZFaMH8B5JxoKzzf5Thic/qs1koWI6gXQHw5omQLa9ZPpaXceOrXNlxcyn+vt0GNDQx9l393+kYyNi71unvMowsjgMkESre8AkSGgvgGf38GrkW9ehLX9UYsc5F7ZEGze3EFBWx0KKS4gzAC1U8P18CSCjXr3JyD+uLTMgKLG8wo/e+GeC1Mgi4ng49O+e6njtQ55YbJINp0Qd66GuPzmzifDm3/XWDsE45InMF5X53wfAOLg+iNkyeBhErOuhfoZjUmrm5DUpfsV9ZAZ1W1IKl7UaJq/QnhQEsbGzvQJ6GV6ORqEQp3BbtVbJnRJdNW1VnjFAvp5g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8867e4c-42cf-41c5-198d-08dd1e2050a0
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 22:23:49.9210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKfV+2Q7pEzbB6F3UPzdlAwHf64yzxg+IlrmBpt02UaUsd4oD+tMgnj9ipDk7UY2k3OiBgYF7n0ORBBTf/wX4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_09,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412160184
X-Proofpoint-GUID: RNcmeJ-3Gzht218m7sGw5C4viCFisCid
X-Proofpoint-ORIG-GUID: RNcmeJ-3Gzht218m7sGw5C4viCFisCid

On 12/5/24 9:33 PM, Oliver Sang wrote:
> hi, Chuck Lever,
> 
> On Thu, Dec 05, 2024 at 10:37:10AM -0500, Chuck Lever wrote:
> 
> [...]
> 
>>
>> Earlier this week I thought I had the full set of patches to
>> test and could just apply them on v6.13-rc1, but it turns out
>> that I don't have them all yet. There are one or two that I
>> broke while trying to prepare for v6.12, and I've misplaced
>> Jeff's originals.
>>
>> I will let you know when that branch is ready for a retest.
>> Sorry for the noise!
> 
> Not at all! always our great pleasure that we can supply any help.
> 
> got it. just wait your notification. thanks!

The series currently in the nfsd-testing branch is complete and stable
enough for you to benchmark.


-- 
Chuck Lever
