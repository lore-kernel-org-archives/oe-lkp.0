Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4445B23A9B8
	for <oe-lkp@lists.linux.dev>; Wed,  2 Apr 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743603820; cv=fail; b=HWtjd06JQc1mR5pcj15A0Q0UFYCoKFb0qgwnhxPxW42RcqkR3iZ09+ZLfTfrCoyrQ54AS4ew+4Sayt3eeBWRHpvJ9PXkoTnmjlFEYH3em9jpfMCotTfrldkptkqmKCn3bpBN/qGLVvlZDC048E98wF00WJq8vByZUNPaMJ/gCQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743603820; c=relaxed/simple;
	bh=P1YJp+Itr/b7nw8gRboIUit47d0YArqKXFszK+SQFjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n1KZOYKoq4KzZIvcQumkhMOv418nkQJ4eKOZTqFa/a/OYD7dJwZaPE4ujwicsDWWWGzRMc65VdXySKjipQasSUa0DVcvSvnEFmffHgdNgO3wI6wJ0m3EjY6JKBJnUR4iodMXyI4JUxSe5m7HiulfAe/jJjxRljhvOs8v+maf790=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KWojL6kL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YKjTBj8E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KWojL6kL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YKjTBj8E"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532EC3k0029610;
	Wed, 2 Apr 2025 14:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=E21+kcc20luoooNEyX
	e9u/P5VD5xdg6hfQpAtHG4PXQ=; b=KWojL6kLG0vPWtXbe7u8i4UDSxr9j/+dCX
	1rPF/dYhNRaN3HNxX08bs1zAxeplKNf2SJPrdxJ2PZwH36/GF+wlycgIzFDQVu9u
	xDakGamzod1zyKze2YRDLhGUTg/iCC4MEnu3nV7IdrkCG7u2heueUpmOTPf1p7+B
	8C1HWS7aWNYyeG1J5Zr+PHJzEQfzMz+5WAE7c4EoQtePjlQy7g5T8caKQwVI2SdP
	yZQ5YLejT2yrO9bggaaTiDIRHtW4SWKg+5xUnIlYhgFL6AcSh23KuZHtfF4E0RNS
	8sdTk6I+u0fuZ0v7p7QJNUN4gKx1C5zzYMEPsZXO+3mt9entS2GQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7satj5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 14:23:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532DeqwB002620;
	Wed, 2 Apr 2025 14:23:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8rux1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 14:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFtADfDcKBYF3Xhev2dOMoY6Czq+VKRn8/tdPWChI3wwmTI6JYxAprctizSMLoIaVBscpm2J9R4dzUJMuxDu8DfrDJjZcWXaGeTosGcERiecUx8UkKV+lu7/NQPxduhwdmLnPerJjQ4oz5AqZ15IIgy1ukt+RMt1/XBWtzq0ULp8TqXK5Cp4UE01N7cIUb2YQsbmiO6CkPVR5wJI8wMJ6b6MqBSmcDF96TBKbiGk3oYoOJCM9jlp4c9KP0g/YARq183ZmhZYS2zX+HZJ3+eGYAlly/mh3zajF3wzmwQPgtHN8jRxZnmVFuRaWy2k4aeSo3c+WaFyFy/XuzRH+6z8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E21+kcc20luoooNEyXe9u/P5VD5xdg6hfQpAtHG4PXQ=;
 b=amKvZLxNCYiMjywTaPzDT0H6JvHdlyLLHLpHufBHuBzzpXFztaJD1AVbq15g66UeAC1cGP4vDuyOpK4IoV5miQBOX0Rnn7Yg6m3L+CSwzYcunNC2MkvL2mqf572S9XQnQYjPDszjf1sHdgRHGuUnQi4iFjYAzUvS9P+wlrOuqiEC/H83J0BnZu7e7LLiUwc96DwfqwoqS1/7slKr+xZPzmKGbEyQvjpaESQ+CVtMsyiVJOrXaODTKmc7ZkbB3tf6zLogkLLyUctmH3i5xwcsRkRy0PNESFcNXVFNgtzc+os6JEBoexfSphoWVZd8jUg1xecIm18/Tlk24Ppc+rVe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E21+kcc20luoooNEyXe9u/P5VD5xdg6hfQpAtHG4PXQ=;
 b=YKjTBj8EQ66nFlthxiW3p/xz4Y/AE3pHzL2vvgmI3nl/nuoMxQFH5IHAs2gtuzcIDIBv909l3pkr1OVSzL0p4QMv35YXdxf6FjdxGOdsjEeFcBYkWhYCiCROtlG6d5h4LODlFqnSl/jtXqqq0iH2fYY4KtSTPHDT3p3O9ndxhlI=
Received: from DS0PR10MB7341.namprd10.prod.outlook.com (2603:10b6:8:f8::22) by
 CYYPR10MB7606.namprd10.prod.outlook.com (2603:10b6:930:c4::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.42; Wed, 2 Apr 2025 14:23:22 +0000
Received: from DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935]) by DS0PR10MB7341.namprd10.prod.outlook.com
 ([fe80::3d6b:a1ef:44c3:a935%6]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 14:23:22 +0000
Date: Wed, 2 Apr 2025 23:23:15 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com,
        linux-mm@kvack.org
Subject: Re: [vbabka:slub-percpu-sheaves-v3] [slab]  c19bb08297:
 BUG:kernel_NULL_pointer_dereference,address
Message-ID: <Z-1IU2OXez-I5H0t@harry>
References: <202503241413.afff5aa1-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503241413.afff5aa1-lkp@intel.com>
X-ClientProxiedBy: SE2P216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::14) To DS0PR10MB7341.namprd10.prod.outlook.com
 (2603:10b6:8:f8::22)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7341:EE_|CYYPR10MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 85dcb261-75b0-4745-6701-08dd71f1ec2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cwmatW25ps7Ib/Bl3ohJVncCdm+deQ+FZ0+7pAAfDF2NeWHUoXocZd4R9wl1?=
 =?us-ascii?Q?xeg/9GcB5nKj4jG5KL1QRadl9BayqTqtEtxdz1cnzJXUfAqCi0wJiBz7J1xT?=
 =?us-ascii?Q?lI7Uy4OohJ5RD33Zn10ImUdCqmhbjTzfi5cIlY1UD0DXVqCaxC63QBYt892T?=
 =?us-ascii?Q?mBNTVMGVWRcs6io3eXbarbb7+DUx6kpewf/f2X333S93WvgLDEfZ1gbJTAvT?=
 =?us-ascii?Q?gPGQSWbcZ6VaDPLjHisHz5TA2TiQnMyIpmfywRG/uH4tzZZCED5wPl/XPXMZ?=
 =?us-ascii?Q?LAY5PhK5lYvbQPWIGYP6VfDn7IcKHZ4V1qDPnESfYms/FN6dpKvMBoUkzBdO?=
 =?us-ascii?Q?aA/m0pZeM63XVGabTUwsW1v/ZXyx+9s+tEe3CY0nCEfPsuSI41EoyHsOH4Tr?=
 =?us-ascii?Q?A3180t6hWRyvaDDJjrWdcSEw7uEgQPoDq74WHfu8uas4VkbF8ijgcjjqkkMz?=
 =?us-ascii?Q?fQqAXu1AUPScf+bohVhp2cPPxIRIJV6EADScmCiqc1Z5BTJaSsX85nm7UhqV?=
 =?us-ascii?Q?oXZutviJG9Ak7fGsiF6h88bre8Wz8W1M3cuvAMjaCSM8f+L9R+KD+esh7zUn?=
 =?us-ascii?Q?o0TGeniAeApqkEjFb0r5Axsq6Q/s7nC/rB62MuGT58bbqT++C1d8udpmNrE3?=
 =?us-ascii?Q?G8CJQc7szutYh6yA48O7T7OpuRGH2RR2I870K5NFYHqcZ2xAFmtbKQHRXtbX?=
 =?us-ascii?Q?CbCuBnl6kFt70v6VCqVrJFQEWZUlfYDpGeL/ma+bnNP78mk71jQrS5pNhbiX?=
 =?us-ascii?Q?+fPlYXdndhNOYqSP8xmEaP3AiKppN02R0zYCirjxl1rZnMDhUuqHCZ1zvq8G?=
 =?us-ascii?Q?RuDY9lptfRux4Ae+U52b3+atgdeI6FMby+F9727dhQR40bbDmjJXomNSGhc0?=
 =?us-ascii?Q?vxgboUW3NCd4gfZtEjaZQ/cmy9IhMd7CDsHbI3b6yt+MG34ywXSznmkB56zy?=
 =?us-ascii?Q?ofT55cDLiQlAXWv8+M5rz8E0WrltrbuzDVrEjUs8zNFgcy08nVH8oV1GvhMd?=
 =?us-ascii?Q?KkMG9YFtrezVxEC8kSGZeftrM0CD7KsAjGFbrh42ACrSrKMkowUjA3VoLVny?=
 =?us-ascii?Q?8IRLSd8/AOBDz9DIy+3S8Y6+mDIy55nrtpv4bQwrX+f7MtTpQYsKtr5toXaA?=
 =?us-ascii?Q?zTaLHa/0/UuOglzjKHra0vQw0dTzbkbmQq7VNIgkxD1fguDRggKwfyICrr7e?=
 =?us-ascii?Q?Lrx8tkhipv6+nb0I1CcA2iRK8zWzBEU4rx3Zqq+pCj2NwsIkurLsCd3FvJAj?=
 =?us-ascii?Q?53Zz6o3mnvGkIBrVXIE8RkbwioXeQDl6YhM1kkCD9R80E7AZCny9nsHzeLG1?=
 =?us-ascii?Q?EFuVUDhDhcCDms3T8WmquYfpn1z32eQk3DXkddoL19qsSw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7341.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OYe/SG8P3UrGNxHgKJnxLG+x+8XIt599wxwYwlL/uutPzRijZmyDjUB3bnKB?=
 =?us-ascii?Q?2hYZjncLYqPLlyaNr3rHSO8yxPOKhBD4F1+LS0rW3Cocu8ncKw5WbSeaQE1d?=
 =?us-ascii?Q?9rX3TJBjGC+Y1po8J/RjtLFWOw550fTiPaIeysfgud+hgxdejvdOwRw87W5z?=
 =?us-ascii?Q?HdrBQGFG9ENzteV28IOoGj31mr/kqYVljQvqeqcaZDTR3IsnqPlJZNuBsc59?=
 =?us-ascii?Q?9V9GAo2FFM5+bRuljGwI9pzVp25iN8XubHm9GuO3PFAZnhyNbaGpaKw1cg6g?=
 =?us-ascii?Q?8uNHhGpdOgMREQ2nWvRnEEWcgYralO6hjRJsXhEZGfxZ5gkrkh/o6a972yV2?=
 =?us-ascii?Q?JAnvInCOafOc/rmS/o8hj71hZFSvB6+sGa6UVEHq6JtFcWVR3Cs8ei52qxeh?=
 =?us-ascii?Q?N3HO9ZsWHm0/Gfm6l+5DX0peeaeupFOP4D9HfCjl+ZAEDvCPVB1UfMUvDsAr?=
 =?us-ascii?Q?HpWEWxNY7U5G2zkr2auKXgL9qfdhmIofAUEIUsAoDhN4QG577OH9BJ2ZZzxN?=
 =?us-ascii?Q?hWYlfdXsl91aqHUg7OZ2v0XcYI+5d2JqNz7fr8rnRqBJQZEvGDQWwATfcceZ?=
 =?us-ascii?Q?3BAXXNJ3/N4vRWe6GnwePdgkbXp3d9/KxRSV7I7/1HVAPjTexGT9gcUCx1Cy?=
 =?us-ascii?Q?nvPHA8d/F0rSXDqPumYQJVMu9hqy7e4DIRp2hGALt+SEkbHYPuqz778wCzLv?=
 =?us-ascii?Q?iiPNM9/00A5Unw4mIbSr+J/b5lo1ihUjILLfRQoDmGdyLA+zv1GW7cxC9qSa?=
 =?us-ascii?Q?emZQ/uTAT0jXEG4OsiE3+0I/7699hPze/zPVW7XcxAYRsExmu7UtmaIJ29N9?=
 =?us-ascii?Q?b/Plen6yuNKlk4zhpgTSlzhvOONFbdvePww0IKnWg55T/2E8LwOM+SNoFzem?=
 =?us-ascii?Q?q50+6mSoUNHd6ZaRAnxq/HCal4Nk29/WIcaF8V5PDnoMZyqXNN0v0LE+ezJC?=
 =?us-ascii?Q?VunOkGnf6lcNkTsIcxZ6vBWiJDzVDYsEdiny3sGGjsWcG9V+eWF9hU7TG0FP?=
 =?us-ascii?Q?ymp2IYEPJnEcpJRphXW+v6fatum8pgMHVLxgHC9z1BcL1/0mccyaxEB+r1jb?=
 =?us-ascii?Q?qWO8AY4G9i3VHhytmMjsSTHAccrANFs47SOvBOJ+SVIyYC1RjugAolxXhME+?=
 =?us-ascii?Q?z+j6Ql+vXKed6fakgx4lALOZp77Jw1Fk04KkVeqDKlZHXvDmNX4JwKSvPoIw?=
 =?us-ascii?Q?nDWxCLHnhsg/ApSGBqu1jsS3GD4sn0mksnBQqUphGSdVZgJLtRaJQtw0venP?=
 =?us-ascii?Q?2OshVC4btnOQNsLiuv032SRxg18ldv5TXwaDXKV7v1ee8gbryELaET7YrzMD?=
 =?us-ascii?Q?dQ0WoOLfnGzcbTxWlkOKyjwGplHzdxcqkpUKrw9XlCmiwJHrRO8b2RDu35+G?=
 =?us-ascii?Q?cKwm8NKFKvMBqx/G8bHlFirGZwI2V77qinS7eV/ufGV7ICej058eSNVzz+iz?=
 =?us-ascii?Q?R8miv6/sHToWId/0rihZMu5g/19OqXNjYHBN5JZtnL0S9zUjLr7IM9fPMW5Q?=
 =?us-ascii?Q?6w7yrszr3YKfGcPZHKd6L77Vmg5yl+qq9Lfo/hvKqd8qFSnhX9tvEvp0o0ZG?=
 =?us-ascii?Q?54mdRoDHHa5aoNDmn0w/qWrDOnEiCnQPbJlmDsy2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8x9hPBP2RtaT6P6OTprFO73E/zz7jZ0nkDIFBk1OeJN8IoLf/FLEqt3oxy+E7qsmX6Bc5IDxiewNjhlUUX2K/3Q4dIutMkA+sCuByC4ZYjr9ze4qF/lzHz557BAXNE1wT9n8lB9GS+gqDLoIZ8BOkLUH5MHCYOeOBLOuegLKy3tAdffXNDMO1TSRWn0/pYlTLmMv3Nm1i1Xl2ONNBkxUwpEL50CwOu6iJfA0LsHxfEqNRudwmAxjQhgwf8Ed5Kapv9FXBPQtPTtO8oVUFXZpL6uA/rssOiUDvaEaPJ42BpiyrY8fe22P0wNtzsowWjsTBhJHydGcOBHHUF3aWulCXQvvOv9/q5RdBIxh8HCojR//FLiZk19iF1pHECV/6/qXDW1VkwSxOFPVWHYFF06OXcRhhAQQqlxsuH2zmZU8gVg5JR2QI+CQMXuZhLteJgrUW79vFurEDeCecd/cK++MU3pdw5zx00qOTamIIoTsrSksotR8VOLu8OjzJkvK912ajV/GdtxdG/ETzjfLpNJUrVhopKhVGcybUSDWxoPsxRQ+kyUdBtQo0cKS6eAHSrLrmCu2XceK7Xt+949J+6al+BNduA0RQia3GE52q0Z+V9s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dcb261-75b0-4745-6701-08dd71f1ec2a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7341.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 14:23:22.1994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnrsYUyw8NOwgeOxxMsk+f/NHDVe538GzrZvSRk0olPU35sv5ECx4yeJrFVmys2k182iohJsR37eNhrVweM6Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020091
X-Proofpoint-GUID: VszpKF6av6sxquKZ4sEGQeHvubkzrdPz
X-Proofpoint-ORIG-GUID: VszpKF6av6sxquKZ4sEGQeHvubkzrdPz

On Mon, Mar 24, 2025 at 02:18:53PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" on:
> 
> commit: c19bb0829736a5c7abe1d1b70d013489d720bb54 ("slab: add opt-in caching layer of percpu sheaves")
> https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3

If HEAD is commit c19bb0829, no user enables sheaves.
That means it's trying to flush sheaves when no users enabled sheaves yet.

#syz test: https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v3

diff --git a/mm/slub.c b/mm/slub.c
index 2c7b2a85c628..dfd301ce4c76 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3853,7 +3853,8 @@ static int slub_cpu_dead(unsigned int cpu)
 	mutex_lock(&slab_mutex);
 	list_for_each_entry(s, &slab_caches, list) {
 		__flush_cpu_slab(s, cpu);
-		__pcs_flush_all_cpu(s, cpu);
+		if (s->cpu_sheaves)
+			__pcs_flush_all_cpu(s, cpu);
 	}
 	mutex_unlock(&slab_mutex);
 	return 0;

> 
> in testcase: rcutorture
> version: 
> with following parameters:
> 
> 	runtime: 300s
> 	test: cpuhotplug
> 	torture_type: srcud
> 
> 
> 
> config: i386-randconfig-005-20250321
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> +---------------------------------------------+------------+------------+
> |                                             | d52c71b1f1 | c19bb08297 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 6          | 0          |
> | boot_failures                               | 0          | 6          |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
> | Oops                                        | 0          | 6          |
> | EIP:slub_cpu_dead                           | 0          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
> +---------------------------------------------+------------+------------+
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202503241413.afff5aa1-lkp@intel.com
> 
> 
> [  100.813833][    T6] BUG: kernel NULL pointer dereference, address: 00000008
> [  100.814405][    T6] #PF: supervisor read access in kernel mode
> [  100.814830][    T6] #PF: error_code(0x0000) - not-present page
> [  100.815260][    T6] *pde = 00000000
> [  100.815526][    T6] Oops: Oops: 0000 [#1] SMP
> [  100.815856][    T6] CPU: 0 UID: 0 PID: 6 Comm: kworker/0:0 Not tainted 6.14.0-rc1-00007-gc19bb0829736 #1
> [  100.816542][    T6] Workqueue: events work_for_cpu_fn
> [ 100.816933][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> [ 100.817301][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
> All code
> ========
>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
>    b:	74 72                	je     0x7f
>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
>   10:	8d 76 00             	lea    0x0(%rsi),%esi
>   13:	8b 1e                	mov    (%rsi),%ebx
>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
>   19:	77 7a                	ja     0x95
>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
>   25:	01 cb                	add    %ecx,%ebx
>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
>   2d:	85 d2                	test   %edx,%edx
>   2f:	74 11                	je     0x42
>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>   34:	89 f0                	mov    %esi,%eax
>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
>   3b:	c7                   	.byte 0xc7
>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
> 	...
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	8b 57 08             	mov    0x8(%rdi),%edx
>    3:	85 d2                	test   %edx,%edx
>    5:	74 11                	je     0x18
>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>    a:	89 f0                	mov    %esi,%eax
>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
>   11:	c7                   	.byte 0xc7
>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
> 	...
> [  100.819393][    T6] EAX: 00000001 EBX: a9148000 ECX: a9148000 EDX: 00000000
> [  100.819900][    T6] ESI: 40392e80 EDI: 00000000 EBP: 401cfe78 ESP: 401cfe68
> [  100.820414][    T6] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
> [  100.820969][    T6] CR0: 80050033 CR2: 00000008 CR3: 7c8e9000 CR4: 00040690
> [  100.821493][    T6] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [  100.822008][    T6] DR6: fffe0ff0 DR7: 00000400
> [  100.822356][    T6] Call Trace:
> [ 100.822609][ T6] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
> [ 100.822935][ T6] ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:434) 
> [ 100.823237][ T6] ? page_fault_oops (arch/x86/mm/fault.c:709) 
> [ 100.823596][ T6] ? kernelmode_fixup_or_oops+0x58/0x70 
> [ 100.824081][ T6] ? __bad_area_nosemaphore+0x10f/0x1f0 
> [ 100.824560][ T6] ? hrtimer_interrupt (kernel/time/hrtimer.c:1877) 
> [ 100.824934][ T6] ? bad_area_nosemaphore (arch/x86/mm/fault.c:834) 
> [ 100.825309][ T6] ? do_user_addr_fault (arch/x86/mm/fault.c:1451) 
> [ 100.825686][ T6] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1049) 
> [ 100.826123][ T6] ? exc_page_fault (arch/x86/include/asm/irqflags.h:26 arch/x86/include/asm/irqflags.h:87 arch/x86/include/asm/irqflags.h:147 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538) 
> [ 100.826474][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> [ 100.826923][ T6] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
> [ 100.827294][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> [ 100.827737][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> [ 100.828071][ T6] ? pvclock_clocksource_read_nowd (arch/x86/mm/fault.c:1493) 
> [ 100.828520][ T6] ? slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> [ 100.828861][ T6] ? cpuhp_invoke_callback (kernel/cpu.c:194) 
> [ 100.829258][ T6] ? __wait_for_common (kernel/sched/completion.c:122) 
> [ 100.829631][ T6] ? hrtimer_nanosleep_restart (kernel/time/sleep_timeout.c:62) 
> [ 100.830069][ T6] ? kfree (mm/slub.c:3777) 
> [ 100.830367][ T6] ? __cpuhp_invoke_callback_range (kernel/cpu.c:967) 
> [ 100.830805][ T6] ? _cpu_down+0xf9/0x390 
> [ 100.831205][ T6] ? __cpu_down_maps_locked (kernel/cpu.c:1475) 
> [ 100.831611][ T6] ? work_for_cpu_fn (kernel/workqueue.c:6731) 
> [ 100.831966][ T6] ? process_one_work (arch/x86/include/asm/atomic.h:23 include/linux/atomic/atomic-arch-fallback.h:457 include/linux/jump_label.h:262 include/trace/events/workqueue.h:110 kernel/workqueue.c:3241) 
> [ 100.832338][ T6] ? worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:3398) 
> [ 100.832694][ T6] ? kthread (kernel/kthread.c:464) 
> [ 100.833001][ T6] ? rescuer_thread (kernel/workqueue.c:3344) 
> [ 100.833356][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
> [ 100.833733][ T6] ? ret_from_fork (arch/x86/kernel/process.c:154) 
> [ 100.838377][ T6] ? kthreads_online_cpu (kernel/kthread.c:413) 
> [ 100.838752][ T6] ? ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
> [ 100.839109][ T6] ? entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
> [  100.839472][    T6] Modules linked in: rcutorture torture
> [  100.839877][    T6] CR2: 0000000000000008
> [  100.840173][    T6] ---[ end trace 0000000000000000 ]---
> [ 100.840547][ T6] EIP: slub_cpu_dead (mm/slub.c:2578 mm/slub.c:2625 mm/slub.c:3783) 
> [ 100.840886][ T6] Code: 01 a1 2c 56 a2 43 3d 2c 56 a2 43 74 72 8d 70 b8 8d 76 00 8b 1e 83 7d f0 07 77 7a 8b 45 f0 8b 0c 85 e0 78 5f 43 01 cb 8b 7b 1c <8b> 57 08 85 d2 74 11 8d 4f 0c 89 f0 e8 c0 e3 ff ff c7 47 08 00 00
> All code
> ========
>    0:	01 a1 2c 56 a2 43    	add    %esp,0x43a2562c(%rcx)
>    6:	3d 2c 56 a2 43       	cmp    $0x43a2562c,%eax
>    b:	74 72                	je     0x7f
>    d:	8d 70 b8             	lea    -0x48(%rax),%esi
>   10:	8d 76 00             	lea    0x0(%rsi),%esi
>   13:	8b 1e                	mov    (%rsi),%ebx
>   15:	83 7d f0 07          	cmpl   $0x7,-0x10(%rbp)
>   19:	77 7a                	ja     0x95
>   1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
>   1e:	8b 0c 85 e0 78 5f 43 	mov    0x435f78e0(,%rax,4),%ecx
>   25:	01 cb                	add    %ecx,%ebx
>   27:	8b 7b 1c             	mov    0x1c(%rbx),%edi
>   2a:*	8b 57 08             	mov    0x8(%rdi),%edx		<-- trapping instruction
>   2d:	85 d2                	test   %edx,%edx
>   2f:	74 11                	je     0x42
>   31:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>   34:	89 f0                	mov    %esi,%eax
>   36:	e8 c0 e3 ff ff       	call   0xffffffffffffe3fb
>   3b:	c7                   	.byte 0xc7
>   3c:	47 08 00             	rex.RXB or %r8b,(%r8)
> 	...
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	8b 57 08             	mov    0x8(%rdi),%edx
>    3:	85 d2                	test   %edx,%edx
>    5:	74 11                	je     0x18
>    7:	8d 4f 0c             	lea    0xc(%rdi),%ecx
>    a:	89 f0                	mov    %esi,%eax
>    c:	e8 c0 e3 ff ff       	call   0xffffffffffffe3d1
>   11:	c7                   	.byte 0xc7
>   12:	47 08 00             	rex.RXB or %r8b,(%r8)
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250324/202503241413.afff5aa1-lkp@intel.com
> 
> 
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)
