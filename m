Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBE328B7E;
	Fri,  5 Dec 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936703; cv=fail; b=ndsk66XIW2/a2d2b3SFIUDMlBJmWlUgdNxHvG72+1b/HW/a7AefF/oR5Z1uofwyPpSc/y7fnJYRycxjatBllL4MFvzX+cQ+ZmdONEtybnx6AS9mrgd8cbPJvI6eeAplDEVMm42lBUFdY4nCK3frIZegD3sriltwGGF/jORbt6fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936703; c=relaxed/simple;
	bh=D5/y9Kba0+cgqakuSh+2TTSPBCbquqfSwLHccIMHD6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WwnqOTfoAdmxKTLKunaM8xRwa44YsU5gN1y4MySRTw41EePwK12muXgmR+9mjPZtOVs1eDYBGTEqiTDDx98ENJLOQhOt8HeoxPrZGtWqq/IgZJTmjByzRamZkyrVr3WDR2JwOQWY0CFCPWBL262ls20yMvQZpC1ZBIhom/faNrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T0j7B/wA; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MZMfKGJq reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T0j7B/wA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MZMfKGJq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B58hXfg3685208;
	Fri, 5 Dec 2025 12:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mtKEO4VWd7yEO25LLH46wQU5n4f6dDV6mtwU50hRUlg=; b=
	T0j7B/wAW88fkclR7KNLp4eO8lc/BiIP+PvDNkJY3nvVZO+vPCYLyRrMzWUlR2S4
	whKcqT/SA3U4X8fA67AhWrZpXY4jQSw4OkTQMJEHX9Rf1B4R2CcxbDEOLtsufZVh
	ThSqVCkfdpdCm73EJvt8kCWJeoE234a1WxO9W5lFm4jOaya4gR8AVllv/vh/XzjE
	K7KYPmE0FJIAbQI7pBjAhcexeBVDRAIIDfEVg4YOStqijBFtXB8ifpl2U8f5yIoF
	7oIYZYQvpPbeyfdmzB5kCWFqzjaC7q9XYROcEehVBBP3/94GTty5ReHIkKi+R/N4
	d/fQTo+HpzPNtO1SumuPfQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aqrvcc7hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 12:11:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5BGNHf004769;
	Fri, 5 Dec 2025 12:11:33 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9dcmuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 12:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhxJ6tq+wb4eHRSkuNx6Ic5d2pRPWWfi9WzuDTAROU8qc3G6A0rAipiP9xoIjSyRBaItKj4RINkX+u4qUrZKPxOY4Ehq+ySd4lzBxIyNN1V0l5xV+PUziwhxSl0wUvEu16DuWwXgfk9c06xfysmB7Ap1G6p8EeHrCptzxSXGbULgzrzqef6GJ6n+9Elac/sfM0X/iwYG+wNG3YqIe+RrT5Rtcfb/antlx7CTSNl2YRnS4dmIkmEhcCUjCplTq8RTYqDAv6OuwAkx+bXucezx0nz4HPzONBD8YcnJrHYedxk+doNVtgM1sT8iRL2dBCkPpsHfy7nNJn515/S7irfrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yXkIge6AgbJtEaguVG+B866GGza9/ykR0TwDok8e6s=;
 b=YLf0iEgbU2+oDEKzoneybmpTUb762oy4UPsM0tHcSQ7Qr0rhc+ivYmguQo48O0onA3D76a7ZMQn1Xfq1Kb05RAeW/qaeQsAjr91VmjwV5DoItwMvZRmFQCnAN6Lu4UesRpOzNB+ex3VcGYz49fyKPzHXciz34uFfhf8rcyLot8CLgBaNjOKXc39eYq4UlljKuF+yTtRRbzQ5QANTE9buCugVYUng0cjw3iOb9l1XAfWoTGmcNkMZpUjCj+7nCYDZpLyqT+MwkPLDxXPonaGHsA1yR9Fwd1nAaP4LDvNwE2ANMzc0jlKZ7pMmdUYKNeew6R3PXlgby1U+8yppfZxazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yXkIge6AgbJtEaguVG+B866GGza9/ykR0TwDok8e6s=;
 b=MZMfKGJqrpWxre01IxwPmZMSSAh5u+u3wOPlZoofs4lUF3hifkUGzgja9+Nqa9YcHArUFF/RAILHkhhXGe8YFnMzXFQ7EL/G5orWxWjrSzCU+/HOKuvVHHE1hmfZf9eYXYvbm9o9EkHxRuRYgPDxgZDdIJOf5WPxqgcnOEIF8JA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4401.namprd10.prod.outlook.com (2603:10b6:303:94::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:11:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 12:11:30 +0000
Date: Fri, 5 Dec 2025 12:11:23 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [mm]  2b6a3f061f:  stress-ng.msg.ops_per_sec
 34.1% regression
Message-ID: <f35b0909-c2e7-4d28-b2c6-30725bf2011f@lucifer.local>
References: <202512041634.150c7e4f-lkp@intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202512041634.150c7e4f-lkp@intel.com>
X-ClientProxiedBy: GVZP280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:270::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4401:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2a29ad-1bba-4681-fbe3-08de33f76c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?C6/dFXRWRQK5fnFklVjVt0N0dabjEKjtNwz1KZGVVJeGUrdwvMUlNyfNPH?=
 =?iso-8859-1?Q?Lrrc0r4F61AM2JtIfGNILRneDpkw7BV9mtYUW9f7SJwu2AsBfjGBklIptV?=
 =?iso-8859-1?Q?XiddbqubkeDw4A47PSepvt3vsAsyeMyhSlqx5q6/KxV2iIeojNTH8WD70D?=
 =?iso-8859-1?Q?RH+4yT/tUSd7hZ1z3x3e7FAq85baWvSN0qwmo0NeK6ZIzg5jL8hbGnMp03?=
 =?iso-8859-1?Q?xvRl0FHK0eg9knij4tY/eoQH4yakk5wvq0UjdaEs2ThL6VPRy4mqaQvhra?=
 =?iso-8859-1?Q?2qudozXecr9HOeeqPajpw1ZXO2+09suJ/qIx4OPPPc+uesgsl5gG7rZHEt?=
 =?iso-8859-1?Q?AEEQPo5G4BF9Uty2Z63wCYnAP+78QxeZkjxbuuDl3qcrQNMVjZyc2Cs3jV?=
 =?iso-8859-1?Q?qzDxN2BUFvQ8LkcG9S8yPlQe9nhnKUbwSs8URk9lFWPn+utDdi9cylcR6J?=
 =?iso-8859-1?Q?nlwVC+GTs0bZL9lQIO6SSvc86ORhcHIkX9rJcX587XHKQn4h6C34mypFzk?=
 =?iso-8859-1?Q?7Ag+i8wdOLHDO0RPbqLtg7Jl7Zr+XrRuA3y8/O6zlBrmQAPMvAyMxvhARc?=
 =?iso-8859-1?Q?kgI+6mn9p7fZwXtxmSYFRu3uB+BUHMfNwxrr7/9BYEzIxgfg28yFgMr+Ud?=
 =?iso-8859-1?Q?waRZDHP1detFBxsYUU1SMkX3Cp2j83l7gKl1jo7qPlZg0XXVBQ5+YAi7b1?=
 =?iso-8859-1?Q?5vjJwx76HHHd00Iry30Kq24iA02p0sY+FvKHP9eUjowT50uDXwG4LNan1k?=
 =?iso-8859-1?Q?Wcn5RAzvFbCINMUYNILPkbaffo48FXIdWq2tkK5Z0trM0GSRpKsE0JAg+F?=
 =?iso-8859-1?Q?YyyXkLa9ACaOmhiQvyCenWS5Eeq4l0XFkw/2970XBMTeKVmr/KbB2iHeej?=
 =?iso-8859-1?Q?ueyKVyWVshuY8sMrCsUcA87DrgePidpw/3wXxgJpdAT9T3sEn6vU3YqpXa?=
 =?iso-8859-1?Q?P5w1LjdpqooaHuuMq9xv5Y4qYxFzj6zihEzWISgZ2HEdzu5XMNFtf6dZSM?=
 =?iso-8859-1?Q?SOLZLLLHNj4Nci5AkpdyUQRa2aVVZP0q4QP63ALc7j8dPhcviYj1dvRrav?=
 =?iso-8859-1?Q?g7Ca2i3QcwHr8a/F4yjXMWF6A7y19s2HLPT0rKdqZe8lgYz3X7jiMiyFIp?=
 =?iso-8859-1?Q?6wgFPLJQqz9a4d6i4vMIU1eSvpeNHy2Xxzba7qzLYcIvPAASNpvPRwi1T0?=
 =?iso-8859-1?Q?nIwccHvLwmnDqmZaFMh9sIyhtRdaJq7SGQFqGPydcvAq0rPzHArE9G2g5v?=
 =?iso-8859-1?Q?kLNiRx10LWjBB/Od16nNl/akhINqEXWHS4KGdSAYa1FUtX4tARHSK5zf6Y?=
 =?iso-8859-1?Q?4gfVntVAbJYQBPxU0SyXGDgNYxbAX7kfK3AJ9eivvIPdZth8Juyx86ThZw?=
 =?iso-8859-1?Q?QDwZuVGxqNINQ2f8d39aV5WOIONAYY3Gk8LOciflE0PahJr5qeijvJlOeV?=
 =?iso-8859-1?Q?hYaq2Tq+cXFLhwVlArRF/95k2vGFxdmNHoI01fSXIehP1qgfjTmKBl8Jxz?=
 =?iso-8859-1?Q?Rdnl0b2pGGt4ySgYhPg2jfA1i/tyISFBj7IxlqKhpDsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?YuAtPD88jJUJ8W5NO+y3sQtziAKL60PBmrI9j4SmlqXp9kRD6zUZbgxctq?=
 =?iso-8859-1?Q?KRpya6pdOvfjt3P6lrTI5+WMuVA4/kWM8eXpkwLTBhDjIm1KI+BS6T0vQ6?=
 =?iso-8859-1?Q?XL016BCws+ZUKEyOtnQtPzuimAEMjOQLM5i8ahpFq2LG4KCYe+nISfzWmy?=
 =?iso-8859-1?Q?eM1h+xf2neCDbEBqLhBMCLpOa6DxfgzBSjf8XcXwJWv2yRt1bPnV8az/Tv?=
 =?iso-8859-1?Q?0F9Vs0tuXdtpvlRKmZ/cGC87ThdGCaHaGK7AdFyUCXAfV+Ym1X8hgSS83C?=
 =?iso-8859-1?Q?fcvtcMRkLX3EC7rJdq1RM9QMjzBHWBNZCV/JY+VLlzzv5ty1TTJlf54A1a?=
 =?iso-8859-1?Q?qefrR5dGNLqv+Kld8rMg2CrlLqbFzJB837aENH8HfVXM5zlg5oMZ3wor7B?=
 =?iso-8859-1?Q?pkD29Xq9/L1PyCmbA7MetsUeV2akhLmj5jtbsPon6PlhpKjwT0OEEGkeVq?=
 =?iso-8859-1?Q?Zy8KFIvrnVkXEev4Wo3VjZ5JcHZnJ+/VZZ3j32t0v1pc71Heljxza6nF8b?=
 =?iso-8859-1?Q?qWG0wtTaGcmJsenRkLZOycCg7wiuyMIDx6NSXR/1FS+h2qWjfhwPOofunA?=
 =?iso-8859-1?Q?HsC3E+CUtekDecWlHAn7gIzfpWH5J3Jd4iYebBtKI1jurTwqKHZmm5hXBn?=
 =?iso-8859-1?Q?VGEiJpB+VMv2/3AGczvLFQb1yp2JwkoRi+KknRPhSIWdM4Nk65Mgcljceo?=
 =?iso-8859-1?Q?jVefWybFg+kWYHIA2qPxdYOdZsVyMHUkNP8YbV99CCwXZ/0JUpdHlfTqGB?=
 =?iso-8859-1?Q?a/7Rc2xXwLcPU1ip0hgzaUt5CXmXjWyoBoqXF1mSzz5SdDFy4NY8QMyH5B?=
 =?iso-8859-1?Q?O915n71+hRZtigTNOdBA0HTUrK8hoTVnDBifqrUFwEcid3KwEXi+vAwQbS?=
 =?iso-8859-1?Q?pFWKG6dACzubGuILwngAeUMmqKNCVvjP/B3fpdgzAVyE9tS20Fu6Y4IvPC?=
 =?iso-8859-1?Q?lXKz75Kl5XI5dz7tY5gxxOCqqCZhUiTZgmhEgrYO9e6OgRn/Cixo18uEEA?=
 =?iso-8859-1?Q?VToI7hABEmbhYLFbYu4uOmzsptgrCQ3kUAdMBmceQdBsyrsdcwtmTEKYW1?=
 =?iso-8859-1?Q?2hNo/pUCGgYQcDXVGGbE0/MSrb8XzYju0sckMRITKZ4ZiR/ml2M6wEPq1l?=
 =?iso-8859-1?Q?8h5ASjWdC3wCGJu/MJfJ5f8r13TuqbV89nNalHTMGhx8dihquL1i1a+VV1?=
 =?iso-8859-1?Q?bAwvp/Ru8ZAPfbrAUngOHigkA1M5IcF+HJrP22tCZNEbn0KBMdygQIQLXk?=
 =?iso-8859-1?Q?g+666UvYgMfIzu4Wnipog7nHG2Lx7kf5FLDs6OXs2xEHLanwEBDDwXo9wZ?=
 =?iso-8859-1?Q?jfeo/mH7QV/a5Iu2f+IuEl9TOB200E8egFY8wjWBexRbUS+9MWagJqIkbl?=
 =?iso-8859-1?Q?eO7ExVs6sdFHoPMMy9Fkmz8kgDNpRC19cSvHd0T6jHBOXCgDTzoD+lXS5O?=
 =?iso-8859-1?Q?ZusPjDcMV47Ah7F5qL3LjLBQh2JnwmMjZjuEedlyrzyFtoKeAaEhmgZF/w?=
 =?iso-8859-1?Q?BM48Qgwmz8USC/5ESD6RXsChP5hLGNfgH1rBmW9h55lQEVK4o4YeocuDUA?=
 =?iso-8859-1?Q?pwlCcQQ9BZYmn+mVObZlf2bYMTRd5GdWeXG6JbQP+kGNMb8smwmBYnLEWN?=
 =?iso-8859-1?Q?r6h9vNy2/dR22fSDufB1bKeyY41yVjtzwrQLXqjkxCc0DXoSW/tvxAhA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XsTSn1wW2panKHxZlPAp1w9XdWylG89a2ZpwnzUIlIYKdqbGVgvwqBnC5mxeUVt4ubYwsYjAKrAv4XR+9JVe7knj2iVBaM8obADIJerJWTmDXUO+KEQY4DHzvu55biT6W4b8T++1W1Ib7KetjsIPNFS7/yw3/QAjmC5dtVpq4b5OPd3v0VFYKC3VrY6yJv0otMYMjo+FwdSs8vgBQ2Kjy8wxiuoYk83T3uRf79cQwsSEfYvv4o3D+hj693k0b+3QyacAZwSxdPB9uJSWr0MySxzMLY45qmdkHcWQzUvF3YvWfcBM++ySZ687cwDJnhdfl4cJDihw18j77vwpvGCvnLckXMOz67Utzw+yVHAgV5lY3acb/g5xCWWOJD4eDc6vN5UF8gtglZphMUirVjPaIscPYwaE+mSOWt/uZYqRoThXPMHAPzakB714+VX8sgyT4g/Pc1QuS5ri4DHE/DQdjfl/HvK0esCiEZMW/PYhndoZ6SX+XpcxgjDNKvim+o/SjTAg7eCL+IglTx8aBcSaQFdzv4R0kCH5VH0tn4E4wpqk4+30Xv0Z8cmM780Vk+p1jvY93u6WQQIKvBMlOpmhIzn+aTNCPo+m/ynSlCQIiXQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2a29ad-1bba-4681-fbe3-08de33f76c21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:11:30.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQkeqJE8l0/1aXAYHhfB/P08z2/NMsgpBKGoGiIJbU4QmqB0psqSAuC1Wux7r1P1Fd+4JwUfpPkmZ+dqQcNpmfnIA9cWak4AbsQCkNkrfE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512050087
X-Authority-Analysis: v=2.4 cv=ZeYQ98VA c=1 sm=1 tr=0 ts=6932cbf6 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=i3X5FwGiAAAA:8 a=NEAV23lmAAAA:8
 a=J-e57H2spYx3ijpAaJcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4NyBTYWx0ZWRfX0vyIxjLBws4x
 03ev66Ih/uPA9eibjm/JhAPcWm4A/9uxi5ch817CMg0lhEewkgVZ1opdJlEUUvpdItjCiQWcrtW
 lYGicevbWsZh7TC8JyA0o7PHU+Sd2drjPGflhSZYAKYQXd6W/2ZgvzVtB8NjiGIHe3d2dKNpLL+
 Dx2Y3kvrYFJbuE/JiJ3wNzmhRBcxyK7TXQ68fo027zX4Sgi9F37leA/Kxn15WyJ2bFs/e4o9hMx
 llNfjBQpjev43Rt1t/zwHCJQ2TlwARS5fm1G0grg4RpJY4dqXRa9oiy0yZMVslT2dyNzSHIUt9z
 Qdc2gcAOvqCi7+VQVnF0O8Yca8MsADzRXgy/LOJ1BB7BO/IU1p0duk7Oxp9AlU/eLcOEeNzfl7a
 HwTKsI7kGo8g/UIKBn+vxRbe3+tgFw==
X-Proofpoint-ORIG-GUID: R1BwbiGo_u024Z82pqMQhEmRJKrq21xe
X-Proofpoint-GUID: R1BwbiGo_u024Z82pqMQhEmRJKrq21xe

On Fri, Dec 05, 2025 at 09:41:37AM +0800, kernel test robot wrote:
>
>
> Hello,
>
> kernel test robot noticed a 34.1% regression of stress-ng.msg.ops_per_sec on:
>
>
> commit: 2b6a3f061f11372af79b862d6184d43193ae927f ("mm: declare VMA flags by bit")

This is strange, as this _should_ have no actual impact on anything.

However, it seems that <= 32-bit flags being declared as de-facto unsigned int
is the delta here, and by declaring everything as an unsigned long via BIT() we
have inadvertantly undone this optimisation.

We can resolve this by having two types of INIT_VM_FLAG() macro - one for 32-bit
flags and one for 64-bit flags and using each as appropriate.

I will send a patch shortly.

Cheers, Lorenzo

> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [still regression on fix commit        4a5a135bf8c51b55fe1b3e6ee91dd6a15c3a56f4]
> [still regression on linux-next/master b2c27842ba853508b0da00187a7508eb3a96c8f7]
>
>
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
> parameters:
>
> 	nr_threads: 100%
> 	testtime: 60s
> 	test: msg
> 	cpufreq_governor: performance
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202512041634.150c7e4f-lkp@intel.com
>
>
> Details are as below:
> -------------------------------------------------------------------------------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251204/202512041634.150c7e4f-lkp@intel.com
>
> =========================================================================================
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/lkp-srf-2sp2/msg/stress-ng/60s
>
> commit:
>   8f4338b114 ("zram: fix a spelling mistake")
>   2b6a3f061f ("mm: declare VMA flags by bit")
>
> 8f4338b1141e1e44 2b6a3f061f11372af79b862d618
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   5.59e+09           +35.8%  7.592e+09        cpuidle..time
>   14613730           -13.3%   12675193        cpuidle..usage
>     760835 ± 11%     -36.5%     482823 ±  9%  numa-numastat.node1.local_node
>     865827 ±  6%     -34.0%     571367 ±  5%  numa-numastat.node1.numa_hit
>    1762536           -13.8%    1519638        meminfo.Active
>    1762520           -13.8%    1519622        meminfo.Active(anon)
>     476452 ±  3%     -33.8%     315279 ±  4%  meminfo.Mapped
>    1019665           -22.2%     792809        meminfo.Shmem
>     686866 ± 25%     -43.4%     389013 ± 30%  numa-meminfo.node0.Active
>     686856 ± 25%     -43.4%     389004 ± 30%  numa-meminfo.node0.Active(anon)
>     302285 ±  9%     -36.8%     191066 ± 20%  numa-meminfo.node1.Mapped
>     684905 ± 11%     -26.3%     504833 ±  8%  numa-meminfo.node1.Shmem
>      43810 ±  4%     -47.9%      22843 ±  2%  perf-c2c.DRAM.remote
>     227578 ±  2%     -52.1%     108981        perf-c2c.HITM.local
>      36971 ±  4%     -52.1%      17724 ±  2%  perf-c2c.HITM.remote
>     264550 ±  3%     -52.1%     126705        perf-c2c.HITM.total
>      46.49           +17.1       63.56        mpstat.cpu.all.idle%
>       0.22            -0.0        0.18        mpstat.cpu.all.soft%
>      49.06           -16.1       32.99        mpstat.cpu.all.sys%
>       3.24            -0.9        2.33        mpstat.cpu.all.usr%
>       5.00 ± 16%    +913.3%      50.67 ±  2%  mpstat.max_utilization.seconds
>      58.01           -32.8%      39.00        mpstat.max_utilization_pct
>     171837 ± 25%     -43.4%      97315 ± 30%  numa-vmstat.node0.nr_active_anon
>     171837 ± 25%     -43.4%      97314 ± 30%  numa-vmstat.node0.nr_zone_active_anon
>      76059 ±  9%     -36.9%      48029 ± 20%  numa-vmstat.node1.nr_mapped
>     171443 ± 11%     -26.3%     126316 ±  8%  numa-vmstat.node1.nr_shmem
>     865096 ±  6%     -34.0%     570583 ±  5%  numa-vmstat.node1.numa_hit
>     760104 ± 11%     -36.6%     482039 ±  9%  numa-vmstat.node1.numa_local
>   1.32e+09           -34.1%  8.706e+08        stress-ng.msg.ops
>   22023874           -34.1%   14521626        stress-ng.msg.ops_per_sec
>      69687           -49.2%      35415        stress-ng.time.involuntary_context_switches
>      10018           -32.7%       6743        stress-ng.time.percent_of_cpu_this_job_got
>       5695           -32.9%       3819        stress-ng.time.system_time
>     325.75           -28.3%     233.63        stress-ng.time.user_time
>   13621503            -3.3%   13174079        stress-ng.time.voluntary_context_switches
>      46.35 ± 28%     -58.5%      19.26 ±  5%  perf-sched.sch_delay.max.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
>      46.35 ± 28%     -58.5%      19.26 ±  5%  perf-sched.total_sch_delay.max.ms
>       3.13 ±  3%     +26.6%       3.96        perf-sched.total_wait_and_delay.average.ms
>    1117872 ±  3%     -20.3%     890994        perf-sched.total_wait_and_delay.count.ms
>       3.11 ±  3%     +26.7%       3.95        perf-sched.total_wait_time.average.ms
>       3.13 ±  3%     +26.6%       3.96        perf-sched.wait_and_delay.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
>    1117872 ±  3%     -20.3%     890994        perf-sched.wait_and_delay.count.[unknown].[unknown].[unknown].[unknown].[unknown]
>       3.11 ±  3%     +26.7%       3.95        perf-sched.wait_time.avg.ms.[unknown].[unknown].[unknown].[unknown].[unknown]
>       1711           -31.8%       1167        turbostat.Avg_MHz
>      53.44           -17.0       36.47        turbostat.Busy%
>      47.13           +16.9       64.05        turbostat.C1%
>      46.41           +36.7%      63.43        turbostat.CPU%c1
>   32786268           -23.1%   25228959        turbostat.IRQ
>    4873079           -30.3%    3398708        turbostat.NMI
>     255.54           -11.7%     225.67        turbostat.PkgWatt
>      17.62            -2.8%      17.13        turbostat.RAMWatt
>     440823           -13.8%     380038        proc-vmstat.nr_active_anon
>     187054            -2.2%     182970        proc-vmstat.nr_anon_pages
>    1174928            -4.8%    1118263        proc-vmstat.nr_file_pages
>     119754 ±  3%     -33.7%      79358 ±  4%  proc-vmstat.nr_mapped
>     255082           -22.2%     198367        proc-vmstat.nr_shmem
>     440823           -13.8%     380038        proc-vmstat.nr_zone_active_anon
>      55634 ± 11%     -23.4%      42629 ±  6%  proc-vmstat.numa_hint_faults
>      48656 ± 17%     -33.2%      32479 ± 17%  proc-vmstat.numa_hint_faults_local
>    1567153 ±  4%     -23.9%    1192609        proc-vmstat.numa_hit
>    1369265 ±  4%     -27.4%     994666        proc-vmstat.numa_local
>    1621735 ±  4%     -23.2%    1246079        proc-vmstat.pgalloc_normal
>     461560            -4.5%     441014        proc-vmstat.pgfault
>    1153560 ±  6%     -23.3%     884516        proc-vmstat.pgfree
>    1815718           -55.1%     815505        sched_debug.cfs_rq:/.avg_vruntime.avg
>    2412826 ±  9%     -49.1%    1229066 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.max
>     968463 ±  3%     -75.4%     238161 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.min
>     118825 ±  6%     -11.9%     104670 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.stddev
>       0.30 ±  3%     -35.3%       0.19 ± 11%  sched_debug.cfs_rq:/.h_nr_queued.avg
>       0.30 ±  4%     -34.8%       0.19 ± 11%  sched_debug.cfs_rq:/.h_nr_runnable.avg
>    1815718           -55.1%     815505        sched_debug.cfs_rq:/.min_vruntime.avg
>    2412826 ±  9%     -49.1%    1229066 ± 10%  sched_debug.cfs_rq:/.min_vruntime.max
>     968463 ±  3%     -75.4%     238161 ±  3%  sched_debug.cfs_rq:/.min_vruntime.min
>     118825 ±  6%     -11.9%     104670 ±  5%  sched_debug.cfs_rq:/.min_vruntime.stddev
>       0.30 ±  4%     -35.0%       0.19 ± 11%  sched_debug.cfs_rq:/.nr_queued.avg
>     402.25 ±  3%     -33.2%     268.59 ±  3%  sched_debug.cfs_rq:/.runnable_avg.avg
>       1419 ± 12%     -35.1%     921.58 ±  9%  sched_debug.cfs_rq:/.runnable_avg.max
>     254.52 ±  3%     -25.1%     190.71 ±  3%  sched_debug.cfs_rq:/.runnable_avg.stddev
>     401.71 ±  3%     -33.2%     268.42 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
>       1419 ± 12%     -35.1%     921.33 ±  9%  sched_debug.cfs_rq:/.util_avg.max
>     253.81 ±  3%     -24.9%     190.54 ±  3%  sched_debug.cfs_rq:/.util_avg.stddev
>     110.78 ±  5%     -64.0%      39.93 ± 14%  sched_debug.cfs_rq:/.util_est.avg
>     144.99 ± 11%     -38.7%      88.87 ±  6%  sched_debug.cfs_rq:/.util_est.stddev
>     703642           +15.4%     811736 ±  2%  sched_debug.cpu.avg_idle.avg
>     274031 ±  3%     +11.1%     304544 ±  7%  sched_debug.cpu.avg_idle.stddev
>     973.22           +10.3%       1073        sched_debug.cpu.clock_task.stddev
>       2553 ±  4%     -38.0%       1583 ±  9%  sched_debug.cpu.curr->pid.avg
>       0.00 ±  6%     -18.2%       0.00 ±  6%  sched_debug.cpu.next_balance.stddev
>       0.30 ±  4%     -36.9%       0.19 ±  9%  sched_debug.cpu.nr_running.avg
>     154189 ±  3%     -25.8%     114332 ±  9%  sched_debug.cpu.nr_switches.max
>       9618 ±  3%     -20.7%       7630 ±  9%  sched_debug.cpu.nr_switches.stddev
>       0.30 ±  5%     +40.6%       0.42 ±  4%  sched_debug.cpu.nr_uninterruptible.avg
>     717.42 ±  6%     -67.5%     232.92 ±  5%  sched_debug.cpu.nr_uninterruptible.max
>      -8660           -59.1%      -3538        sched_debug.cpu.nr_uninterruptible.min
>     645.97 ±  3%     -59.3%     262.89 ±  2%  sched_debug.cpu.nr_uninterruptible.stddev
>       0.87 ±  2%     +17.8%       1.03        perf-stat.i.MPKI
>   1.51e+10           -36.5%  9.589e+09        perf-stat.i.branch-instructions
>       0.34            -0.0        0.31        perf-stat.i.branch-miss-rate%
>   51316978           -42.8%   29341873        perf-stat.i.branch-misses
>      14.78 ±  2%      +1.2       16.00        perf-stat.i.cache-miss-rate%
>   66087672 ±  3%     -24.3%   50023541        perf-stat.i.cache-misses
>  4.553e+08           -29.9%  3.194e+08        perf-stat.i.cache-references
>     450491            -3.3%     435839        perf-stat.i.context-switches
>       4.31            +6.1%       4.57        perf-stat.i.cpi
>   3.32e+11           -31.7%  2.269e+11        perf-stat.i.cpu-cycles
>     103340           -49.3%      52435        perf-stat.i.cpu-migrations
>       5121 ±  3%     -10.8%       4569        perf-stat.i.cycles-between-cache-misses
>  7.705e+10           -35.6%  4.961e+10        perf-stat.i.instructions
>       0.23            -5.9%       0.22        perf-stat.i.ipc
>       2.34            -3.2%       2.26        perf-stat.i.metric.K/sec
>       6077 ±  2%      -6.5%       5680        perf-stat.i.minor-faults
>       6077 ±  2%      -6.5%       5681        perf-stat.i.page-faults
>       0.86 ±  2%     +17.7%       1.01        perf-stat.overall.MPKI
>       0.34            -0.0        0.31        perf-stat.overall.branch-miss-rate%
>      14.50 ±  2%      +1.2       15.66        perf-stat.overall.cache-miss-rate%
>       4.31            +6.1%       4.57        perf-stat.overall.cpi
>       5034 ±  3%      -9.9%       4535        perf-stat.overall.cycles-between-cache-misses
>       0.23            -5.8%       0.22        perf-stat.overall.ipc
>  1.485e+10           -36.5%  9.431e+09        perf-stat.ps.branch-instructions
>   50480713           -42.8%   28856943        perf-stat.ps.branch-misses
>   64956364 ±  3%     -24.3%   49194321        perf-stat.ps.cache-misses
>   4.48e+08           -29.9%  3.141e+08        perf-stat.ps.cache-references
>     443136            -3.3%     428680        perf-stat.ps.context-switches
>  3.266e+11           -31.7%  2.231e+11        perf-stat.ps.cpu-cycles
>     101675           -49.3%      51574        perf-stat.ps.cpu-migrations
>  7.581e+10           -35.6%   4.88e+10        perf-stat.ps.instructions
>       5911 ±  2%      -5.9%       5561        perf-stat.ps.minor-faults
>       5911 ±  2%      -5.9%       5561        perf-stat.ps.page-faults
>   4.65e+12           -36.0%  2.978e+12        perf-stat.total.instructions
>      45.02 ±  2%     -27.4       17.66        perf-profile.calltrace.cycles-pp.__percpu_counter_sum.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.msgctl
>      43.42 ±  2%     -27.0       16.37        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.__percpu_counter_sum.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      43.29 ±  2%     -27.0       16.27        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__percpu_counter_sum.ksys_msgctl.do_syscall_64
>       5.70 ±  2%      -2.8        2.86        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.do_msgsnd.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       4.30 ±  2%      -2.8        1.50 ± 10%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       3.61 ±  3%      -2.2        1.40 ±  4%  perf-profile.calltrace.cycles-pp.percpu_counter_add_batch.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       3.56 ±  3%      -1.9        1.65 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.05 ± 19%      -0.7        0.36 ± 71%  perf-profile.calltrace.cycles-pp._raw_spin_lock.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>       1.15 ±  4%      +0.1        1.28 ±  5%  perf-profile.calltrace.cycles-pp.__memcg_slab_free_hook.kfree.free_msg.do_msgrcv.do_syscall_64
>       0.93            +0.1        1.06        perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
>       1.02            +0.1        1.15        perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>       1.32 ±  2%      +0.1        1.46 ±  4%  perf-profile.calltrace.cycles-pp.stress_msg_receiver
>       0.56            +0.1        0.70        perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
>       0.66            +0.2        0.84        perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt
>       0.67            +0.2        0.86        perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt
>       1.04            +0.2        1.27        perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
>       1.14            +0.2        1.37        perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>       1.14            +0.2        1.38        perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>       1.13            +0.2        1.37        perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
>       1.16            +0.2        1.41        perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
>       1.16            +0.2        1.41        perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
>       2.41 ±  2%      +0.3        2.74 ±  5%  perf-profile.calltrace.cycles-pp.store_msg.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.48            +0.3        1.82        perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       1.09 ± 10%      +0.4        1.51 ± 10%  perf-profile.calltrace.cycles-pp._copy_to_user.store_msg.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.78            +0.5        2.24        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
>       1.78            +0.5        2.24        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
>       1.78            +0.5        2.25        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
>       0.17 ±141%      +0.5        0.64 ±  2%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>       0.17 ±141%      +0.5        0.64 ±  2%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>       0.17 ±141%      +0.5        0.66 ±  6%  perf-profile.calltrace.cycles-pp.queue_event.ordered_events__queue.process_simple.reader__read_event.perf_session__process_events
>       0.00            +0.5        0.51        perf-profile.calltrace.cycles-pp.__schedule.schedule.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read
>       0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.schedule.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.ksys_msgctl
>       0.00            +0.5        0.52        perf-profile.calltrace.cycles-pp.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.ksys_msgctl.do_syscall_64
>       0.00            +0.6        0.61        perf-profile.calltrace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
>       0.86 ± 70%      +0.6        1.49 ±  2%  perf-profile.calltrace.cycles-pp.stress_msg_sender.stress_msg
>       0.00            +0.6        0.63 ±  2%  perf-profile.calltrace.cycles-pp.seq_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +0.6        0.63 ±  2%  perf-profile.calltrace.cycles-pp.seq_read_iter.seq_read.vfs_read.ksys_read.do_syscall_64
>       0.00            +0.6        0.64 ±  7%  perf-profile.calltrace.cycles-pp.perf_session__deliver_event.__ordered_events__flush.perf_session__process_user_event.reader__read_event.perf_session__process_events
>       2.00            +0.6        2.64        perf-profile.calltrace.cycles-pp.common_startup_64
>       0.00            +0.7        0.72 ±  2%  perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.msgctl_down.ksys_msgctl
>       0.00            +0.9        0.92        perf-profile.calltrace.cycles-pp.rwsem_wake.up_write.msgctl_down.ksys_msgctl.do_syscall_64
>       0.00            +1.0        0.99        perf-profile.calltrace.cycles-pp.up_write.msgctl_down.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +1.2        1.25        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write.msgctl_down
>       0.00            +1.4        1.38        perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_write_slowpath.down_write.msgctl_down.ksys_msgctl
>       0.00            +1.6        1.58 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read.ksys_msgctl
>       0.00            +1.7        1.68 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.down_read.ksys_msgctl.do_syscall_64
>       0.39 ± 70%      +2.2        2.62        perf-profile.calltrace.cycles-pp.rwsem_down_read_slowpath.down_read.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.50 ± 45%      +2.3        2.81        perf-profile.calltrace.cycles-pp.down_read.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.msgctl
>       0.62 ±  8%      +2.3        2.97        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.msgctl_down.ksys_msgctl.do_syscall_64
>       0.66 ±  8%      +2.4        3.09        perf-profile.calltrace.cycles-pp.down_write.msgctl_down.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.18 ±  7%      +3.1        4.23        perf-profile.calltrace.cycles-pp.msgctl_down.ksys_msgctl.do_syscall_64.entry_SYSCALL_64_after_hwframe.msgctl
>       0.60 ± 47%      +3.5        4.08 ± 14%  perf-profile.calltrace.cycles-pp.ipc_obtain_object_check.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>      17.33 ±  3%      +7.7       24.99 ±  4%  perf-profile.calltrace.cycles-pp.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       2.29 ±  3%     +11.2       13.47 ±  4%  perf-profile.calltrace.cycles-pp.ipc_obtain_object_check.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      13.69 ± 58%     +15.1       28.78        perf-profile.calltrace.cycles-pp.do_msgsnd.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>       0.00           +15.5       15.46        perf-profile.calltrace.cycles-pp.__radix_tree_lookup.ipc_obtain_object_check.do_msgsnd.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00           +15.5       15.50        perf-profile.calltrace.cycles-pp.__radix_tree_lookup.ipc_obtain_object_check.do_msgrcv.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.79 ± 70%     +15.6       17.35        perf-profile.calltrace.cycles-pp.ipc_obtain_object_check.do_msgsnd.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>      20.10 ± 48%     +18.1       38.20 ±  2%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.stress_msg
>      20.35 ± 48%     +18.2       38.56 ±  2%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.stress_msg
>      53.96           -29.3       24.65        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
>      45.22 ±  2%     -27.4       17.87        perf-profile.children.cycles-pp.__percpu_counter_sum
>      43.75 ±  2%     -26.4       17.30        perf-profile.children.cycles-pp._raw_spin_lock_irqsave
>      47.31 ±  2%     -21.6       25.71        perf-profile.children.cycles-pp.ksys_msgctl
>      47.53 ±  2%     -21.6       25.93        perf-profile.children.cycles-pp.msgctl
>      11.91 ±  2%      -5.7        6.21        perf-profile.children.cycles-pp._raw_spin_lock
>       8.92 ±  2%      -5.2        3.67        perf-profile.children.cycles-pp.percpu_counter_add_batch
>      91.35            -1.5       89.83        perf-profile.children.cycles-pp.do_syscall_64
>      91.76            -1.5       90.26        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
>       3.82 ±  2%      -0.4        3.38        perf-profile.children.cycles-pp.load_msg
>       2.83 ±  2%      -0.4        2.40        perf-profile.children.cycles-pp.__kmalloc_node_noprof
>       0.49 ±  8%      -0.2        0.25 ±  4%  perf-profile.children.cycles-pp.___slab_alloc
>       0.31 ±  3%      -0.1        0.21        perf-profile.children.cycles-pp.ss_wakeup
>       0.23 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.idle_cpu
>       0.23 ±  2%      -0.0        0.20 ±  2%  perf-profile.children.cycles-pp.sysvipc_msg_proc_show
>       0.22 ±  3%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.seq_printf
>       0.22 ±  3%      -0.0        0.19 ±  2%  perf-profile.children.cycles-pp.vsnprintf
>       0.07            -0.0        0.05        perf-profile.children.cycles-pp.select_idle_sibling
>       0.05            +0.0        0.06        perf-profile.children.cycles-pp.cpuacct_charge
>       0.06            +0.0        0.07        perf-profile.children.cycles-pp.available_idle_cpu
>       0.09            +0.0        0.10        perf-profile.children.cycles-pp.wake_affine
>       0.10 ±  4%      +0.0        0.11        perf-profile.children.cycles-pp.nohz_balance_enter_idle
>       0.10 ±  4%      +0.0        0.12        perf-profile.children.cycles-pp.update_rq_clock
>       0.13            +0.0        0.15 ±  2%  perf-profile.children.cycles-pp.update_curr
>       0.12 ±  3%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_se
>       0.05            +0.0        0.07        perf-profile.children.cycles-pp.llist_reverse_order
>       0.05            +0.0        0.07 ±  8%  perf-profile.children.cycles-pp.set_next_task_fair
>       0.07            +0.0        0.09        perf-profile.children.cycles-pp.sched_balance_domains
>       0.10 ±  4%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
>       0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.clockevents_program_event
>       0.07 ±  5%      +0.0        0.09        perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
>       0.06            +0.0        0.08 ±  4%  perf-profile.children.cycles-pp.menu_select
>       0.08 ±  5%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.prepare_task_switch
>       0.05            +0.0        0.08 ±  6%  perf-profile.children.cycles-pp.tick_nohz_restart_sched_tick
>       0.04 ± 44%      +0.0        0.07 ±  5%  perf-profile.children.cycles-pp.set_next_entity
>       0.06 ±  9%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.tick_nohz_idle_exit
>       0.06            +0.0        0.09        perf-profile.children.cycles-pp.hrtimer_start_range_ns
>       0.11 ±  4%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.tick_nohz_idle_stop_tick
>       0.10 ±  7%      +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.tick_nohz_stop_tick
>       0.10            +0.0        0.13 ±  3%  perf-profile.children.cycles-pp.task_work_run
>       0.08 ± 13%      +0.0        0.12 ± 11%  perf-profile.children.cycles-pp.update_cfs_group
>       0.05 ±  7%      +0.0        0.08 ± 16%  perf-profile.children.cycles-pp.map__put
>       0.11            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
>       0.04 ± 71%      +0.0        0.07 ± 10%  perf-profile.children.cycles-pp.maps__get
>       0.15            +0.0        0.19 ±  2%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
>       0.08 ± 12%      +0.0        0.12 ±  9%  perf-profile.children.cycles-pp.thread__find_map
>       0.08            +0.0        0.12        perf-profile.children.cycles-pp.update_rq_clock_task
>       0.08 ±  5%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.task_mm_cid_work
>       0.10            +0.0        0.14 ±  3%  perf-profile.children.cycles-pp.__resched_curr
>       0.25 ±  2%      +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.dequeue_entities
>       0.02 ±141%      +0.0        0.06 ± 11%  perf-profile.children.cycles-pp.callchain_cursor_append
>       0.22 ±  2%      +0.0        0.27 ±  2%  perf-profile.children.cycles-pp.dequeue_entity
>       0.03 ±100%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.addr_location__exit
>       0.26            +0.0        0.30 ±  2%  perf-profile.children.cycles-pp.dequeue_task_fair
>       0.06 ± 11%      +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.maps__put
>       0.12 ±  4%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.wakeup_preempt
>       0.00            +0.1        0.05        perf-profile.children.cycles-pp.ipcctl_obtain_check
>       0.00            +0.1        0.05        perf-profile.children.cycles-pp.irq_enter_rcu
>       0.00            +0.1        0.05        perf-profile.children.cycles-pp.tick_irq_enter
>       0.55            +0.1        0.60        perf-profile.children.cycles-pp.update_sg_lb_stats
>       0.56            +0.1        0.62        perf-profile.children.cycles-pp.update_sd_lb_stats
>       0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
>       0.00            +0.1        0.05 ±  7%  perf-profile.children.cycles-pp.update_other_load_avgs
>       0.06 ±  9%      +0.1        0.11 ± 36%  perf-profile.children.cycles-pp.callchain_cursor_reset
>       0.26 ±  2%      +0.1        0.31 ±  2%  perf-profile.children.cycles-pp.try_to_block_task
>       0.56            +0.1        0.62        perf-profile.children.cycles-pp.sched_balance_find_src_group
>       0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.__get_next_timer_interrupt
>       0.01 ±223%      +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
>       0.04 ± 44%      +0.1        0.10 ±  3%  perf-profile.children.cycles-pp.rwsem_mark_wake
>       0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.get_jiffies_update
>       0.00            +0.1        0.06        perf-profile.children.cycles-pp.update_irq_load_avg
>       0.42            +0.1        0.48        perf-profile.children.cycles-pp.update_load_avg
>       0.09            +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.__update_blocked_fair
>       0.64            +0.1        0.71        perf-profile.children.cycles-pp.sched_balance_rq
>       0.08            +0.1        0.15 ±  5%  perf-profile.children.cycles-pp.sysvipc_proc_start
>       0.20 ±  2%      +0.1        0.27 ±  2%  perf-profile.children.cycles-pp.schedule_idle
>       0.09 ±  8%      +0.1        0.16 ± 25%  perf-profile.children.cycles-pp.map_symbol__exit
>       0.30            +0.1        0.37        perf-profile.children.cycles-pp.enqueue_entity
>       0.35 ±  2%      +0.1        0.43        perf-profile.children.cycles-pp.enqueue_task
>       0.34            +0.1        0.42        perf-profile.children.cycles-pp.enqueue_task_fair
>       0.41            +0.1        0.49        perf-profile.children.cycles-pp._nohz_idle_balance
>       0.44            +0.1        0.52        perf-profile.children.cycles-pp.handle_softirqs
>       0.14 ±  2%      +0.1        0.22 ±  2%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
>       0.44            +0.1        0.53        perf-profile.children.cycles-pp.__irq_exit_rcu
>       0.64            +0.1        0.74        perf-profile.children.cycles-pp.sched_balance_newidle
>       0.21            +0.1        0.32        perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
>       0.15 ±  3%      +0.1        0.26 ±  3%  perf-profile.children.cycles-pp.sysvipc_proc_next
>       0.22 ± 10%      +0.1        0.34 ± 10%  perf-profile.children.cycles-pp.add_callchain_ip
>       0.23 ± 10%      +0.1        0.36 ±  8%  perf-profile.children.cycles-pp.thread__resolve_callchain_sample
>       0.50 ±  2%      +0.1        0.63        perf-profile.children.cycles-pp.ttwu_do_activate
>       0.71            +0.1        0.85        perf-profile.children.cycles-pp.pick_next_task_fair
>       0.73            +0.1        0.87        perf-profile.children.cycles-pp.__pick_next_task
>       0.10 ±  4%      +0.1        0.25        perf-profile.children.cycles-pp.msgctl_stat
>       0.00            +0.1        0.14 ±  5%  perf-profile.children.cycles-pp.radix_tree_next_chunk
>       0.00            +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.idr_get_next_ul
>       0.50 ±  2%      +0.1        0.64 ±  2%  perf-profile.children.cycles-pp.ksys_read
>       0.00            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.idr_get_next
>       0.49 ±  2%      +0.1        0.64 ±  2%  perf-profile.children.cycles-pp.vfs_read
>       0.49 ±  2%      +0.2        0.64 ±  2%  perf-profile.children.cycles-pp.seq_read_iter
>       0.60            +0.2        0.75        perf-profile.children.cycles-pp.wake_up_q
>       0.49 ±  2%      +0.2        0.64 ±  2%  perf-profile.children.cycles-pp.seq_read
>       0.54            +0.2        0.70        perf-profile.children.cycles-pp.try_to_wake_up
>       0.58            +0.2        0.74        perf-profile.children.cycles-pp.sched_ttwu_pending
>       1.50 ±  2%      +0.2        1.67        perf-profile.children.cycles-pp.__memcg_slab_free_hook
>       0.49 ±  4%      +0.2        0.66 ±  6%  perf-profile.children.cycles-pp.ordered_events__queue
>       0.22            +0.2        0.40        perf-profile.children.cycles-pp.rest_init
>       0.22            +0.2        0.40        perf-profile.children.cycles-pp.start_kernel
>       0.22            +0.2        0.40        perf-profile.children.cycles-pp.x86_64_start_kernel
>       0.22            +0.2        0.40        perf-profile.children.cycles-pp.x86_64_start_reservations
>       0.48 ±  4%      +0.2        0.66 ±  6%  perf-profile.children.cycles-pp.queue_event
>       0.29 ± 10%      +0.2        0.48 ± 11%  perf-profile.children.cycles-pp.__thread__resolve_callchain
>       1.72 ±  3%      +0.2        1.90 ±  2%  perf-profile.children.cycles-pp.stress_msg_receiver
>       0.51 ±  2%      +0.2        0.69 ±  6%  perf-profile.children.cycles-pp.process_simple
>       0.30 ±  8%      +0.2        0.48 ± 11%  perf-profile.children.cycles-pp.sample__for_each_callchain_node
>       0.04 ± 44%      +0.2        0.23        perf-profile.children.cycles-pp.rwsem_spin_on_owner
>       0.70            +0.2        0.89        perf-profile.children.cycles-pp.__sysvec_call_function_single
>       0.32 ±  9%      +0.2        0.52 ± 11%  perf-profile.children.cycles-pp.build_id__mark_dso_hit
>       0.70            +0.2        0.89        perf-profile.children.cycles-pp.__flush_smp_call_function_queue
>       0.63            +0.2        0.84        perf-profile.children.cycles-pp.schedule_preempt_disabled
>       1.28 ±  3%      +0.2        1.51 ±  2%  perf-profile.children.cycles-pp.stress_msg_sender
>       0.39 ±  4%      +0.2        0.64 ±  7%  perf-profile.children.cycles-pp.perf_session__deliver_event
>       0.40 ±  5%      +0.2        0.64 ±  7%  perf-profile.children.cycles-pp.__ordered_events__flush
>       0.40 ±  5%      +0.2        0.64 ±  7%  perf-profile.children.cycles-pp.perf_session__process_user_event
>       0.08            +0.3        0.34        perf-profile.children.cycles-pp.up_read
>       1.15            +0.3        1.42        perf-profile.children.cycles-pp.schedule
>       1.15            +0.3        1.45        perf-profile.children.cycles-pp.sysvec_call_function_single
>       1.33            +0.3        1.67        perf-profile.children.cycles-pp.__schedule
>       0.29 ±  5%      +0.4        0.66        perf-profile.children.cycles-pp.nohz_balance_exit_idle
>       1.27            +0.4        1.68        perf-profile.children.cycles-pp.asm_sysvec_call_function_single
>       1.34            +0.4        1.75        perf-profile.children.cycles-pp.pv_native_safe_halt
>       1.34            +0.4        1.76        perf-profile.children.cycles-pp.acpi_idle_do_entry
>       1.34            +0.4        1.76        perf-profile.children.cycles-pp.acpi_safe_halt
>       1.34            +0.4        1.76        perf-profile.children.cycles-pp.acpi_idle_enter
>       1.37            +0.4        1.79        perf-profile.children.cycles-pp.cpuidle_enter
>       1.36            +0.4        1.79        perf-profile.children.cycles-pp.cpuidle_enter_state
>       1.52 ± 11%      +0.4        1.96        perf-profile.children.cycles-pp._copy_to_user
>       3.16 ±  5%      +0.5        3.61        perf-profile.children.cycles-pp.store_msg
>       1.78            +0.5        2.25        perf-profile.children.cycles-pp.start_secondary
>       0.92 ±  4%      +0.5        1.39        perf-profile.children.cycles-pp.perf_session__process_events
>       0.92 ±  4%      +0.5        1.39        perf-profile.children.cycles-pp.reader__read_event
>       0.95 ±  2%      +0.5        1.43        perf-profile.children.cycles-pp.update_process_times
>       0.42 ±  4%      +0.5        0.90        perf-profile.children.cycles-pp.nohz_balancer_kick
>       0.98 ±  3%      +0.5        1.46        perf-profile.children.cycles-pp.tick_nohz_handler
>       1.02 ±  3%      +0.5        1.51        perf-profile.children.cycles-pp.hrtimer_interrupt
>       0.99 ±  3%      +0.5        1.47        perf-profile.children.cycles-pp.__hrtimer_run_queues
>       1.13 ±  2%      +0.5        1.62        perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
>       1.03 ±  3%      +0.5        1.52        perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
>       1.08 ±  3%      +0.5        1.57        perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
>       1.69            +0.5        2.21        perf-profile.children.cycles-pp.cpuidle_idle_call
>       0.41 ±  2%      +0.6        1.00        perf-profile.children.cycles-pp.up_write
>       0.46 ±  2%      +0.6        1.09        perf-profile.children.cycles-pp.rwsem_wake
>       2.00            +0.6        2.64        perf-profile.children.cycles-pp.do_idle
>       2.00            +0.6        2.64        perf-profile.children.cycles-pp.common_startup_64
>       2.00            +0.6        2.64        perf-profile.children.cycles-pp.cpu_startup_entry
>       0.05 ±  7%      +0.7        0.73        perf-profile.children.cycles-pp.osq_lock
>       0.64 ±  3%      +2.1        2.79        perf-profile.children.cycles-pp.rwsem_down_read_slowpath
>       0.68 ±  3%      +2.3        2.99        perf-profile.children.cycles-pp.down_read
>       0.66 ±  2%      +2.4        3.01        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
>       0.68 ±  2%      +2.4        3.12        perf-profile.children.cycles-pp.down_write
>       0.34 ±  5%      +2.8        3.18 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irq
>       1.23 ±  2%      +3.0        4.28        perf-profile.children.cycles-pp.msgctl_down
>      19.31 ±  2%      +9.8       29.14        perf-profile.children.cycles-pp.do_msgsnd
>      22.51 ±  2%     +10.1       32.64        perf-profile.children.cycles-pp.do_msgrcv
>       5.68 ±  2%     +29.6       35.26        perf-profile.children.cycles-pp.ipc_obtain_object_check
>       0.39 ±  2%     +31.0       31.35        perf-profile.children.cycles-pp.__radix_tree_lookup
>      53.80           -29.2       24.55        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
>       8.78 ±  2%      -5.2        3.60        perf-profile.self.cycles-pp.percpu_counter_add_batch
>       1.81 ±  2%      -0.4        1.41        perf-profile.self.cycles-pp._raw_spin_lock
>       0.46 ±  8%      -0.2        0.22 ±  4%  perf-profile.self.cycles-pp.___slab_alloc
>       1.34            -0.2        1.16        perf-profile.self.cycles-pp.__percpu_counter_sum
>       0.30 ±  2%      -0.1        0.20 ±  2%  perf-profile.self.cycles-pp.ss_wakeup
>       0.45 ±  3%      -0.1        0.36        perf-profile.self.cycles-pp.__kmalloc_node_noprof
>       0.71 ±  2%      -0.1        0.63        perf-profile.self.cycles-pp.do_syscall_64
>       0.22 ±  2%      -0.0        0.20 ±  2%  perf-profile.self.cycles-pp.idle_cpu
>       0.08 ±  6%      -0.0        0.05        perf-profile.self.cycles-pp.vsnprintf
>       0.07            -0.0        0.06        perf-profile.self.cycles-pp.kick_ilb
>       0.07            -0.0        0.06        perf-profile.self.cycles-pp.syscall_return_via_sysret
>       0.10            +0.0        0.11        perf-profile.self.cycles-pp.load_msg
>       0.06            +0.0        0.07        perf-profile.self.cycles-pp.available_idle_cpu
>       0.10 ±  4%      +0.0        0.11        perf-profile.self.cycles-pp.nohz_balance_enter_idle
>       0.09            +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.update_rq_clock
>       0.10 ±  4%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
>       0.10            +0.0        0.12 ±  3%  perf-profile.self.cycles-pp.__schedule
>       0.07            +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
>       0.06 ±  6%      +0.0        0.08        perf-profile.self.cycles-pp.cpuidle_idle_call
>       0.08            +0.0        0.10 ±  3%  perf-profile.self.cycles-pp.prepare_task_switch
>       0.05            +0.0        0.07        perf-profile.self.cycles-pp.llist_reverse_order
>       0.10            +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.__update_load_avg_se
>       0.03 ± 70%      +0.0        0.06        perf-profile.self.cycles-pp.enqueue_entity
>       0.17 ±  2%      +0.0        0.20 ±  3%  perf-profile.self.cycles-pp.update_load_avg
>       0.06            +0.0        0.09        perf-profile.self.cycles-pp.update_rq_clock_task
>       0.08 ± 13%      +0.0        0.12 ± 11%  perf-profile.self.cycles-pp.update_cfs_group
>       0.06 ±  8%      +0.0        0.09        perf-profile.self.cycles-pp.__update_blocked_fair
>       0.04 ± 45%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.map__put
>       0.08            +0.0        0.12        perf-profile.self.cycles-pp.task_mm_cid_work
>       0.40            +0.0        0.44        perf-profile.self.cycles-pp.update_sg_lb_stats
>       0.10            +0.0        0.14 ±  3%  perf-profile.self.cycles-pp.__resched_curr
>       0.06 ± 11%      +0.0        0.10 ± 20%  perf-profile.self.cycles-pp.maps__put
>       0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
>       0.02 ±141%      +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.maps__get
>       0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.sched_ttwu_pending
>       0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.update_irq_load_avg
>       0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.get_jiffies_update
>       0.03 ± 70%      +0.1        0.10 ±  5%  perf-profile.self.cycles-pp.rwsem_mark_wake
>       0.00            +0.1        0.07        perf-profile.self.cycles-pp.up_write
>       0.00            +0.1        0.08        perf-profile.self.cycles-pp.sched_balance_newidle
>       0.12 ±  3%      +0.1        0.22 ±  2%  perf-profile.self.cycles-pp.pv_native_safe_halt
>       0.00            +0.1        0.11        perf-profile.self.cycles-pp.ksys_msgctl
>       0.00            +0.1        0.12 ±  4%  perf-profile.self.cycles-pp.down_write
>       0.12 ±  4%      +0.1        0.24        perf-profile.self.cycles-pp.nohz_balancer_kick
>       3.78 ±  2%      +0.1        3.90        perf-profile.self.cycles-pp.ipc_obtain_object_check
>       0.00            +0.1        0.14 ±  5%  perf-profile.self.cycles-pp.radix_tree_next_chunk
>       0.00            +0.2        0.17 ±  2%  perf-profile.self.cycles-pp.up_read
>       0.20 ±  2%      +0.2        0.38        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
>       1.38 ±  2%      +0.2        1.55        perf-profile.self.cycles-pp.__memcg_slab_free_hook
>       0.48 ±  4%      +0.2        0.65 ±  6%  perf-profile.self.cycles-pp.queue_event
>       1.68 ±  3%      +0.2        1.86 ±  2%  perf-profile.self.cycles-pp.stress_msg_receiver
>       0.00            +0.2        0.19 ±  2%  perf-profile.self.cycles-pp.down_read
>       0.02 ± 99%      +0.2        0.22        perf-profile.self.cycles-pp.rwsem_spin_on_owner
>       0.08            +0.2        0.28        perf-profile.self.cycles-pp.rwsem_down_write_slowpath
>       1.24 ±  2%      +0.2        1.46 ±  2%  perf-profile.self.cycles-pp.stress_msg_sender
>       0.10            +0.2        0.33        perf-profile.self.cycles-pp.rwsem_down_read_slowpath
>       0.00            +0.2        0.25        perf-profile.self.cycles-pp._raw_spin_lock_irq
>       1.59 ±  9%      +0.4        1.94        perf-profile.self.cycles-pp.do_msgrcv
>       0.29 ±  5%      +0.4        0.66        perf-profile.self.cycles-pp.nohz_balance_exit_idle
>       1.47 ± 11%      +0.4        1.90        perf-profile.self.cycles-pp._copy_to_user
>       0.05 ±  7%      +0.7        0.72        perf-profile.self.cycles-pp.osq_lock
>       1.39 ±  4%      +1.0        2.38        perf-profile.self.cycles-pp.do_msgsnd
>       0.39           +30.4       30.74        perf-profile.self.cycles-pp.__radix_tree_lookup
>
>
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are provided
> for informational purposes only. Any difference in system hardware or software
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
